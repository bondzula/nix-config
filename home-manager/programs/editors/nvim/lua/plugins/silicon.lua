local loaded, silicon = pcall(require, 'silicon')

if not loaded then
  return
end

silicon.setup({
  output = string.format(
    "/home/bondzula/Pictures/Screenshots/nvim_%s-%s-%s_%s-%s.png",
    os.date("%Y"),
    os.date("%m"),
    os.date("%d"),
    os.date("%H"),
    os.date("%M")
  ),
})
