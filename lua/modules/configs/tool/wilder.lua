return function()
	local wilder = require("wilder")
	local icons = { ui = require("modules.utils.icons").get("ui") }

	wilder.setup({ modes = { ":", "/", "?" } })
	wilder.set_option("use_python_remote_plugin", 0)
	wilder.set_option("pipeline", {
		wilder.branch(
			wilder.cmdline_pipeline({ use_python = 0, fuzzy = 1, fuzzy_filter = wilder.lua_fzy_filter() }),
			wilder.vim_search_pipeline(),
			{
				wilder.check(function(_, x)
					return x == ""
				end),
				wilder.history(),
				wilder.result({
					draw = {
						function(_, x)
							return icons.ui.Calendar .. " " .. x
						end,
					},
				}),
			}
		),
	})

	local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		border = "rounded",
		highlights = {
			default = "Pmenu",
			border = "PmenuBorder", -- highlight to use for the border
			accent = wilder.make_hl("WilderAccent", "CmpItemAbbr", "CmpItemAbbrMatch"),
		},
		empty_message = wilder.popupmenu_empty_message_with_spinner(),
		highlighter = wilder.lua_fzy_highlighter(),
		left = {
			" ",
			wilder.popupmenu_devicons(),
			wilder.popupmenu_buffer_flags({
				flags = " a + ",
				icons = { ["+"] = icons.ui.Pencil, a = icons.ui.Indicator, h = icons.ui.File },
			}),
		},
		right = {
			" ",
			wilder.popupmenu_scrollbar(),
		},
	}))
	local wildmenu_renderer = wilder.wildmenu_renderer({
		highlighter = wilder.lua_fzy_highlighter(),
		apply_incsearch_fix = true,
		separator = " | ",
		left = { " ", wilder.wildmenu_spinner(), " " },
		right = { " ", wilder.wildmenu_index() },
	})
	wilder.set_option(
		"renderer",
		wilder.renderer_mux({
			[":"] = popupmenu_renderer,
			["/"] = wildmenu_renderer,
			substitute = wildmenu_renderer,
		})
	)
end

-- return function()
-- 	local wilder = require("wilder")
-- 	wilder.setup({
-- 		modes = { ":", "/", "?" },
-- 		next_key = "<Tab>",
-- 		previous_key = "<S-Tab>",
-- 		accept_key = "<Down>",
-- 		reject_key = "<Up>",
-- 	})
-- 	local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
-- 		highlighter = wilder.basic_highlighter(),
-- 		highlights = {
-- 			bg = "NormalFloat",
-- 			border = "NormalFloat", -- highlight to use for the border
-- 		},
-- 		pumblend = 20,
-- 		-- 'single', 'double', 'rounded' or 'solid'
-- 		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
-- 		-- border = "rounded",
-- 		left = { " ", wilder.popupmenu_devicons() },
-- 		right = { " ", wilder.popupmenu_scrollbar() },
-- 	}))

-- 	local wildmenu_renderer = wilder.wildmenu_renderer({
-- 		highlighter = wilder.basic_highlighter(),
-- 		highlights = {
-- 			bg = "NormalFloat",
-- 			border = "NormalFloat", -- highlight to use for the border
-- 		},
-- 		separator = " · ",
-- 		left = { " ", wilder.wildmenu_spinner(), " " },
-- 		right = { " ", wilder.wildmenu_index() },
-- 	})
-- 	-- wilder.set_option(
-- 	--     "renderer",
-- 	--     wilder.renderer_mux({
-- 	--         [":"] = popupmenu_renderer,
-- 	--         ["/"] = wildmenu_renderer,
-- 	--     })
-- 	-- )

-- 	wilder.set_option(
-- 		"renderer",
-- 		wilder.popupmenu_renderer(
-- 			-- highlighter = wilder.basic_highlighter(),
-- 			wilder.popupmenu_palette_theme({
-- 				-- 'single', 'double', 'rounded' or 'solid'
-- 				-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
-- 				border = "rounded",
-- 				max_height = "75%", -- max height of the palette
-- 				min_height = 0, -- set to the same as 'max_height' for a fixed height window
-- 				prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
-- 				reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
-- 			})
-- 		)
-- 	)
-- 	-- wilder.set_option('renderer', wilder.popupmenu_renderer({
-- 	--   -- highlighter = wilder.basic_highlighter(),
-- 	--   -- left = {' ', wilder.popupmenu_devicons()},
-- 	--   -- right = {' ', wilder.popupmenu_scrollbar()},
-- 	--   wilder.popupmenu_palette_theme({
-- 	--     -- 'single', 'double', 'rounded' or 'solid'
-- 	--     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
-- 	--     border = 'rounded',
-- 	--     max_height = '75%',      -- max height of the palette
-- 	--     min_height = 0,          -- set to the same as 'max_height' for a fixed height window
-- 	--     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
-- 	--     reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
-- 	--   })
-- 	-- }))
-- end
