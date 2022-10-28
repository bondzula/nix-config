local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

if not lspconfig_ok then
	return
end

local dictionary_file = {
  ["en-US"] = { vim.fn.stdpath("config") .. "/spell/dictionary.txt" }
}
local disabled_rules_file = {
  ["en-US"] = { vim.fn.stdpath("config") .. "/spell/disable.txt" }
}
local false_positives_file = {
  ["en-US"] = { vim.fn.stdpath("config") .. "/spell/false.txt" }
}

local function readFiles(files)
  local dict = {}
  for _,file in ipairs(files) do
    if not file then return nil end

    for line in io.lines(file) do
      table.insert(dict, line)
    end
  end
  return dict
end

lspconfig.ltex.setup({
  filetypes = { "gitcommit", "markdown", "org", "plaintex", "tex", "NeogitCommitMessage" },
	settings = {
		ltex = {
			language = "en-US",
			additionalRules = {
				enablePickyRules = true,
				languageModel = "$XDG_DATA_HOME/ngrams/",
			},
      dictionary = {
        ["en-US"] = readFiles(dictionary_file['en-US'] or {})
      },
      disabledRules = {
        ["en-US"] = readFiles(disabled_rules_file['en-US'] or {})
      },
      hiddenFalsePositives = {
        ["en-US"] = readFiles(false_positives_file['en-US'] or {})
      },
		},
	}
})


local function findLtexLang()
  local buf_clients = vim.lsp.buf_get_clients()
  for _, client in ipairs(buf_clients) do
    if client.name == "ltex" then
      return client.config.settings.ltex.language
    end
  end
end

local function findLtexFiles(filetype, value)
  local files = nil
  if filetype == 'dictionary' then
    files = dictionary_file[value or findLtexLang()]
  elseif filetype == 'disable' then
    files = disabled_rules_file[value or findLtexLang()]
  elseif filetype == 'falsePositive' then
    files = false_positives_file[value or findLtexLang()]
  end

  if files then
    return files
  else
    return nil
  end
end

local function updateConfig(lang, configtype)
  local buf_clients = vim.lsp.buf_get_clients()
  local client = nil
  for _, lsp in ipairs(buf_clients) do
    if lsp.name == "ltex" then
      client = lsp
    end
  end

  if client then
    if configtype == 'dictionary' then
      if client.config.settings.ltex.dictionary then
        client.config.settings.ltex.dictionary = {
          [lang] = readFiles(dictionary_file[lang])
        };
        return client.notify('workspace/didChangeConfiguration', client.config.settings)
      else
        return vim.notify("Error when reading dictionary config, check it")
      end
    elseif configtype == 'disable' then
      if client.config.settings.ltex.disabledRules then
        client.config.settings.ltex.disabledRules = {
          [lang] = readFiles(disabled_rules_file[lang])
        };
        return client.notify('workspace/didChangeConfiguration', client.config.settings)
      else
        return vim.notify("Error when reading disabledRules config, check it")
      end

    elseif configtype == 'falsePositive' then
      if client.config.settings.ltex.hiddenFalsePositives then
        client.config.settings.ltex.hiddenFalsePositives = {
          [lang] = readFiles(false_positives_file[lang])
        };
        return client.notify('workspace/didChangeConfiguration', client.config.settings)
      else
        return vim.notify("Error when reading hiddenFalsePositives config, check it")
      end
    end
  else
    return nil
  end
end

local function addToFile(filetype, lang, file, value)
  file = io.open(file[#file-0], "a+") -- add only to last file defined.
  if file then
    file:write(value .. "\n")
    file:close()
  else
    return print("Failed insert %q", value)
  end
  if filetype == 'dictionary' then
    return updateConfig(lang, "dictionary")
  elseif filetype == 'disable' then
    return updateConfig(lang, "disable")
  elseif filetype == 'falsePositive' then
    return updateConfig(lang, "disable")
  end
end

local function addTo(filetype, lang, file, value)
  local dict = readFiles(file)
  for _, v in ipairs(dict) do
    if v == value then
      return nil
    end
  end

  return addToFile(filetype, lang, file, value)
end

-- https://github.com/neovim/nvim-lspconfig/issues/858 can't intercept,
-- override it then.
local orig_execute_command = vim.lsp.buf.execute_command

vim.lsp.buf.execute_command = function(command)
  if command.command == '_ltex.addToDictionary' then
    local arg = command.arguments[1].words -- can I really access like this?
    for lang, words in pairs(arg) do
      for _, word in ipairs(words) do
        local filetype = "dictionary"
        addTo(filetype,lang, findLtexFiles(filetype,lang), word)
      end
    end
  elseif command.command == '_ltex.disableRules' then
    local arg = command.arguments[1].ruleIds -- can I really access like this?
    for lang, rules in pairs(arg) do
      for _, rule in ipairs(rules) do
        local filetype = "disable"
        addTo(filetype,lang,findLtexFiles(filetype,lang), rule)
      end
    end

  elseif command.command == '_ltex.hideFalsePositives' then
    local arg = command.arguments[1].falsePositives -- can I really access like this?
    for lang, rules in pairs(arg) do
      for _, rule in ipairs(rules) do
        local filetype = "falsePositive"
        addTo(filetype,lang,findLtexFiles(filetype,lang), rule)
      end
    end
  else
    orig_execute_command(command)
  end
end
