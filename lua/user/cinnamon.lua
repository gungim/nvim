local status_ok, cinnamon = pcall(require, "cinnamon")
if not status_ok then
	return
end

cinnamon.setup({
	extra_keymaps = true,
	override_keymaps = true,
	max_length = 500,
	scroll_limit = -1,
})
