local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local hl = vim.api.nvim_set_hl
local icons = require "plugins.winbar.icons"
local space = " "

hl(0, "NavicText",          { default = true, link = "Conceal" })
hl(0, "NavicSeparator",     { default = true, link = "LineNr" })

-- Customized config
navic.setup {
  icons = {
    File          = "%#CmpItemKindFile#" .. icons.kind.File .. "%*" .. space,
    Module        = "%#CmpItemKindModule#" .. icons.kind.Module .. "%*" .. space,
    Namespace     = "%#CmpItemKindField#" .. icons.kind.Namespace .. "%*" .. space,
    Package       = "%#CmpItemKindField#" .. icons.kind.Package .. "%*" .. space,
    Class         = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. space,
    Method        = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. space,
    Property      = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
    Field         = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
    Constructor   = "%#CmpItemKindConstructor#" .. icons.kind.Constructor .. "%*" .. space,
    Enum          = "%#CmpItemKindEnum#" .. icons.kind.Enum .. "%*" .. space,
    Interface     = "%#CmpItemKindInterface#" .. icons.kind.Interface .. "%*" .. space,
    Function      = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. space,
    Variable      = "%#CmpItemKindVariable#" .. icons.kind.Variable .. "%*" .. space,
    Constant      = "%#CmpItemKindConstant#" .. icons.kind.Constant .. "%*" .. space,
    String        = "%#CmpItemKindValue#" .. icons.kind.String .. "%*" .. space,
    Number        = "%#CmpItemKindValue#" .. icons.kind.Number .. "%*" .. space,
    Boolean       = "%#CmpItemKindValue#" .. icons.kind.Boolean .. "%*" .. space,
    Array         = "%#CmpItemKindValue#" .. icons.kind.Array .. "%*" .. space,
    Object        = "%#CmpItemKindValue#" .. icons.kind.Object .. "%*" .. space,
    Key           = "%#CmpItemKindKey#" .. icons.kind.Key .. "%*" .. space,
    Null          = "%#CmpItemKindValue#" .. icons.kind.Null .. "%*" .. space,
    EnumMember    = "%#CmpItemKindEnumMember#" .. icons.kind.EnumMember .. "%*" .. space,
    Struct        = "%#CmpItemKindStruct#" .. icons.kind.Struct .. "%*" .. space,
    Event         = "%#CmpItemKindEvent#" .. icons.kind.Event .. "%*" .. space,
    Operator      = "%#CmpItemKindOperator#" .. icons.kind.Operator .. "%*" .. space,
    TypeParameter = "%#CmpItemKindTypeParameter#" .. icons.kind.TypeParameter .. "%*" .. space,
  },

  highlight = true,
  separator = "%#Conceal#" .. " " .. icons.ui.ChevronRight .. "%*" .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
