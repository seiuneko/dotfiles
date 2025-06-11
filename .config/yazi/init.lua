-- Show user/group of files in status bar
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)

-- Show username and hostname in header
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. " "):fg("blue")
end, 500, Header.RIGHT)

-- show the motion in the status bar
require("relative-motions"):setup({ show_numbers="relative_absolute", show_motion = true, enter_mode ="first" })

-- session.yazi
require("session"):setup {
	sync_yanked = true,
}

-- bookmarks.yazi
require("bookmarks"):setup({
	last_directory = { enable = true, persist = false, mode="dir" },
	persist = "all",
	desc_format = "full",
	file_pick_mode = "parent",
	custom_desc_input = false,
	notify = {
		enable = true,
		timeout = 3,
	},
})

-- git.yazi
require("git"):setup()

-- gvfs.yazi
require("gvfs"):setup({
  -- (Optional) Allowed keys to select device.
  which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",

  -- (Optional) Save file.
  -- Default: ~/.config/yazi/gvfs.private
  save_path = os.getenv("HOME") .. "/.local/state/yazi/gvfs.private"
})

