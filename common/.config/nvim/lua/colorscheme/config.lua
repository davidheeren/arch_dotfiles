-- Simplified configuration file
-- You can change these values to tweak the theme's appearance.

local config = {}

-- Basic style settings
config.styles = {
	bold = true,
	italic = true,
	transparency = false,
}

-- Semantic group mappings to palette colors
config.groups = {
	border = "muted",
	link = "purple",
	panel = "surface",

	error = "red",
	hint = "purple",
	info = "blue",
	ok = "green",
	warn = "yellow",
	note = "cyan",
	todo = "magenta",

	git_add = "blue",
	git_change = "magenta",
	git_delete = "red",
	git_dirty = "magenta",
	git_ignore = "muted",
	git_merge = "purple",
	git_rename = "cyan",
	git_stage = "purple",
	git_text = "magenta",
	git_untracked = "subtle",

	h1 = "purple",
	h2 = "blue",
	h3 = "magenta",
	h4 = "yellow",
	h5 = "cyan",
	h6 = "green",
}

-- Differentiate between active and inactive windows and panels.
config.dim_inactive_windows = false

-- Extend background behind borders.
config.extend_background_behind_borders = true

-- Enable terminal colors.
config.enable_terminal = true

return config
