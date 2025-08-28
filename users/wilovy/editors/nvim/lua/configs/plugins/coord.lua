return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VimEnter",
  opts = function()
    return {
      -- Basic display settings
      display = {
        theme = "default", -- or 'atom', 'vscode', 'github'
        flavor = "dark", -- or 'light'
      },

      -- Custom text display
      text = {
        editing = function(opts)
          local text = string.format("Editing %s", opts.filename)
          -- Add [+] indicator for modified buffers
          if vim.bo.modified then
            text = text .. " [+]"
          end
          -- Show cursor position
          text = text .. string.format(" - %s:%s", opts.cursor_line, opts.cursor_char)
          return text
        end,
        viewing = function(opts)
          return string.format("Viewing %s", opts.filename)
        end,
        workspace = function(opts)
          -- Time-based status messages
          local hour = tonumber(os.date("%H"))
          local status = hour >= 22 and "🌙 Late night coding"
              or hour >= 18 and "🌆 Evening session"
              or hour >= 12 and "☀️ Afternoon coding"
              or hour >= 6 and "🌅 Morning productivity"
              or "🌙 Midnight hacking"

          return string.format("%s in %s", status, opts.workspace)
        end,
      },

      -- Custom idle configuration
      idle = {
        enable = true,
        details = function(opts)
          return string.format("Taking a break from %s", opts.workspace)
        end,
        -- Use keyboard icon for idle state
        icon = function()
          return require("cord.api.icon").get("keyboard")
        end,
      },

      -- Git integration
      variables = {
        git_status = function(opts)
          -- Get current git branch, suppress errors if not in git repo
          local git_branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
          -- Return the branch name if it exists, otherwise nil
          return git_branch ~= "" and git_branch or nil
        end,
      },

      -- Dynamic buttons
      buttons = {
        {
          label = function(opts)
            return opts.repo_url and "View Repository" or "My GitHub"
          end,
          url = function(opts)
            -- Hide buttons when idle
            if opts.is_idle then
              return nil
            end
            return opts.repo_url or "https://github.com/yourusername"
          end,
        },
      },

      -- Custom hooks for advanced functionality
      hooks = {
        -- Update git branch when workspace changes
        workspace_change = function(opts)
          -- Refresh git branch info
          local git_branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
          opts.variables.git_status = git_branch ~= "" and git_branch or nil
        end,

        -- Add Neovim version to small tooltip
        post_activity = function(opts, activity)
          local version = vim.version()
          activity.assets.small_text =
              string.format("Neovim %s.%s.%s", version.major, version.minor, version.patch)

          -- Add git branch to details if available
          if opts.git_status then
            activity.state = string.format("Branch: %s", opts.git_status)
          end
        end,
      },
    }
  end,

  -- Add keymappings
  config = function(_, opts)
    require("cord").setup(opts)

    vim.keymap.set("n", "<leader>dt", function()
      require("cord.api.command").toggle_presence()
    end, { desc = "Toggle Discord presence" })

    vim.keymap.set("n", "<leader>di", function()
      require("cord.api.command").toggle_idle_force()
    end, { desc = "Toggle idle state" })
  end,
}
