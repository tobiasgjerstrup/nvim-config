return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values

    -- Extensions for the picker
    local extensions = { "lua", "js", "ts", "go", "json", "html", "css" }

    -- Picker function
    local function extension_live_grep()
      pickers.new({}, {
        prompt_title = "Select file extension",
        finder = finders.new_table(extensions),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")

          actions.select_default:replace(function()
            local ext = action_state.get_selected_entry().value
            actions.close(prompt_bufnr)

            builtin.live_grep({
              additional_args = function()
                return { "--glob=*." .. ext }
              end,
            })
          end)

          return true
        end,
      }):find()
    end

    telescope.setup({
      defaults = {
        preview = { treesitter = false },
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
      },
    })

    -- Expose picker so you can call it from your keymap
    telescope.extensions = telescope.extensions or {}
    telescope.extensions.extension_live_grep = extension_live_grep
  end,
}

