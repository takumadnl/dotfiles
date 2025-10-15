-- # WezTerm Configuration #
local wezterm = require 'wezterm'
local act     = wezterm.action
local config  = wezterm.config_builder()

-- ====================
-- ## general ##
-- ====================
config.term = 'wezterm'
config.automatically_reload_config = false
-- config.use_ime = true -- activate in default
config.scrollback_lines = 10000

-- local zsh = '/usr/local/bin/zsh'
-- config.default_prog = { zsh, '-l' }
-- config.canonicalize_pasted_newlines = 'CarriageReturn'

config.notification_handling = 'AlwaysShow'

-- ====================
-- ## window ##
-- ====================
config.initial_cols = 120
config.initial_rows = 40

config.window_padding = {
  left   = 2,
  right  = 0,
  top    = 0,
  bottom = 0,
}

-- フルスクリーン時にmacOSのメニューを表示できる
config.native_macos_fullscreen_mode = true

-- ====================
-- ## command palette ##
-- ====================
config.command_palette_bg_color = '#1a1a1a'
config.command_palette_fg_color = '#9f9f9f'
config.command_palette_font_size = 18
config.command_palette_rows = 15


-- ====================
-- ## font ##
-- ====================
config.font = wezterm.font_with_fallback {
  'UDEV Gothic NF',
  'HackGen Console NF',
  'PlemolJP Console NF',
  'Moralerspace Argon HW',
  'Moralerspace Neon HW',
  'FirgeNerd Console',
  'UDEV Gothic NFLG',
}
config.font_size = 15
-- config.harfbuzz_features = { 'zero' }

-- * freetype_load_target
--    - Normal  (default)
--    - Light
--    - Mono
--    - HorizontalLcd
--    - VerticalLcd
config.freetype_load_target   = 'Light'
config.freetype_render_target = 'Light'
config.bold_brightens_ansi_colors = 'BrightAndBold'
-- config.bold_brightens_ansi_colors = 'BrightOnly'
-- config.bold_brightens_ansi_colors = 'No'


-- ====================
-- ## hyper link  ##
-- ====================
config.hyperlink_rules = wezterm.default_hyperlink_rules()


-- ====================
-- ## mouse ##
-- ====================
config.swallow_mouse_click_on_pane_focus = true
-- ホイールスクロールでタブが切り替わらないようにする
config.mouse_wheel_scrolls_tabs = false


-- ====================
-- ## color scheme ##
-- ====================
-- config.color_scheme_dirs = { '/Users/takuma/.local/share/colorschemes/wezterm' }
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Gotham (Gogh)'
-- config.color_scheme = 'Gruvbox Dark'
-- config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Kanagawa Dragon (Gogh)' -- nightly
-- config.color_scheme = 'kanagawabones'
config.color_scheme = 'Oceanic Next (Gogh)'
-- config.color_scheme = 'Oceanic-Next'
-- config.color_scheme = 'Ocean Dark'
-- config.color_scheme = 'OneHalfDark'
-- config.color_scheme = 'Ayu Mirage'
-- config.color_scheme = 'Ayu Mirage (Gogh)'
-- config.color_scheme = 'Ayu Dark (Gogh)'
-- config.color_scheme = 'catppuccin-mocha'
-- config.color_scheme = 'Catppuccin Mocha (Gogh)'
-- config.color_scheme = 'Catppuccin Macchiato (Gogh)'
-- config.color_scheme = 'monokai_remastered'
-- config.color_scheme = 'Solarized Dark - Patched'
-- config.color_scheme = 'Solarized Dark (Gogh)'
-- config.color_scheme = 'Solarized Dark Higher Contrast (Gogh)'
-- config.color_scheme = 'Dracula'
-- config.color_scheme = 'Dracula (Gogh)'
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.color_scheme = 'rose-pine'
-- config.color_scheme = 'Github Dark (Gogh)'
-- config.color_scheme = 'Alien Blood (Gogh)'
-- config.color_scheme = 'Afterglow (Gogh)'


-- ====================
-- ## tab bar ##
-- ====================
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 20
config.show_new_tab_button_in_tab_bar = false
config.status_update_interval = 10000 -- 単位はms

local status_bar_content_padding = '  '
local status_bar_color_themes = {
  yellow = {
    base_fg   = '#a88b19',
    base_bg   = '#110e00',
    bright_fg = '#ffe03b',
    dimmed_bg = '#0a1820',
  },
  green = {
    base_fg   = '#1a9b69',
    base_bg   = '#001109',
    bright_fg = '#49ffb8',
    dimmed_bg = '#0a1820',
  },
  blue = {
    base_fg   = '#1fa2a2',
    base_bg   = '#001111',
    bright_fg = '#4affff',
    dimmed_bg = '#0a1820',
  },
  orange = {
    base_fg   = '#a26729',
    base_bg   = '#110700',
    bright_fg = '#ffa340',
    dimmed_bg = '#0a1820',
  },
}
local status_colors = status_bar_color_themes.yellow
config.colors = {
  -- foreground = '#ffffff',
  tab_bar = {
    background = status_colors.base_bg,
    active_tab = {
      bg_color  = status_colors.base_bg,
      fg_color  = status_colors.bright_fg,
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color  = status_colors.base_bg,
      fg_color  = status_colors.base_fg,
      intensity = 'Normal',
    },
  },
}

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  else
    return tab_info.active_pane.title
  end
end

local tab_content_padding = '   '
wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
    local title = tab_title(tab)
    title = wezterm.truncate_right(title, max_width)

    local zoomed = nil
    if tab.active_pane.is_zoomed then
      zoomed = ' [z]'
    end

    return {
      { Text = tab_content_padding },
      { Text = string.format('%d. ', tab.tab_index + 1) },
      { Text = title },
      { Text = zoomed or tab_content_padding },
    }
  end
)


local cached_os_icon = ''
local function os_icon()
  -- ターミナルの実行ホストが変更されることはまずないためキャッシュを使用
  if cached_os_icon and #cached_os_icon > 0 then
    return cached_os_icon
  end

  local _, stdout, _ = wezterm.run_child_process {
    wezterm.home_dir .. '/bin/os_info', '-i'
  }
  cached_os_icon = string.gsub(stdout, '\n', '') or ''
  return cached_os_icon
end

-- local cached_hostname_short = ''
local function hostname_short()
  return string.gsub(wezterm.hostname(), '%.local$', '')
end

-- wezterm.on('gui-attached', function(_)
--   ;
-- end)

local function default_shell()
  local shell = os.getenv('SHELL') or ''
  -- wezterm.log_info('shell: ' .. shell)
  return shell
end

-- render status bar
wezterm.on('update-status', function (window, _)
  -- Right
  local date = wezterm.strftime '%Y-%m-%d %H:%M'

  window:set_right_status(wezterm.format {
    { Foreground = { Color     = status_colors.bright_fg } },
    { Attribute  = { Intensity = 'Bold'                  } },
    { Text = os_icon() },
    { Text = hostname_short() },

    { Text = status_bar_content_padding },

    { Foreground = { Color     = status_colors.base_fg } },
    { Attribute  = { Intensity = 'Normal'              } },
    { Text = date },

    { Text = status_bar_content_padding },
  })

  -- Left
  local workspace_name = wezterm.mux.get_active_workspace()
  local left_status_max_width = 15
  workspace_name = wezterm.pad_right(
    workspace_name .. ':',
    left_status_max_width
  )

  window:set_left_status(wezterm.format {
    { Text = status_bar_content_padding },

    { Foreground = { Color     = status_colors.base_fg } },
    { Attribute  = { Intensity = 'Normal'              } },
    { Text = workspace_name },
  })
end)


wezterm.on('format-window-title', function(tab, _pane, tabs, _panes, _config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  return 'wezterm: ' .. zoomed .. index .. tab.active_pane.title
end)


wezterm.on('window-config-reloaded', function(window, _pane)
  wezterm.log_info('config reloaded')
  window:toast_notification('WezTerm', 'configuration reloaded!', nil, 4000)
end)

-- ============================================================
-- ## key binds ##
-- ============================================================
-- ** keyは大文字にするとShiftなしでは反応しなくなるので注意！
config.disable_default_key_bindings = true
config.leader = { mods = 'CTRL', key = 'q', timeout_milliseconds = 1000 }
config.keys = {
  { mods = 'NONE',   key = 'F11',   action = act.ToggleFullScreen       },
  { mods = 'NONE',   key = 'F1',    action = act.ActivateCommandPalette },

  -- { mods = 'CTRL',   key = 'l',     action = act.ClearScrollback 'ScrollbackOnly' },

  { mods = 'NONE',   key = 'PageUp',    action = act.ScrollByPage(-1)   },
  { mods = 'NONE',   key = 'PageDown',  action = act.ScrollByPage(1)    },
  { mods = 'NONE',   key = 'Home',      action = act.ScrollToTop        },
  { mods = 'NONE',   key = 'End',       action = act.ScrollToBottom     },
  { mods = 'SUPER',  key = 'UpArrow',   action = act.ScrollToPrompt(-1) },
  { mods = 'SUPER',  key = 'DownArrow', action = act.ScrollToPrompt(1)  },

  { mods = 'SUPER',  key = 'f',     action = act.Search { CaseInSensitiveString = '' } },
  { mods = 'SUPER',  key = 'v',     action = act.PasteFrom 'Clipboard' },
  { mods = 'SUPER',  key = 'c',     action = act.CopyTo    'Clipboard' },
  { mods = 'SUPER',  key = 'r',     action = act.ReloadConfiguration },

  -- 遅くなるためペイン分割にログインシェルは使わない
  --     =>`-l`オプションを使用しない
  {
    mods = 'LEADER',
    key = '\\',
    action = act.SplitHorizontal { args = { default_shell() } }
  },
  {
    mods = 'LEADER',
    key = '|',
    action = act.SplitHorizontal { args = { default_shell() } }
  },
  {
    mods = 'LEADER',
    key = '-',
    action = act.SplitVertical   { args = { default_shell() } }
  },

  { mods = 'LEADER', key = 'h',     action = act.ActivatePaneDirection 'Left'   },
  { mods = 'LEADER', key = 'j',     action = act.ActivatePaneDirection 'Down'   },
  { mods = 'LEADER', key = 'k',     action = act.ActivatePaneDirection 'Up'     },
  { mods = 'LEADER', key = 'l',     action = act.ActivatePaneDirection 'Right'  },

  { mods = 'LEADER', key = '1',     action = act.ActivateTab(0) },
  { mods = 'LEADER', key = '2',     action = act.ActivateTab(1) },
  { mods = 'LEADER', key = '3',     action = act.ActivateTab(2) },
  { mods = 'LEADER', key = '4',     action = act.ActivateTab(3) },
  { mods = 'LEADER', key = '5',     action = act.ActivateTab(4) },
  { mods = 'LEADER', key = '6',     action = act.ActivateTab(5) },
  { mods = 'LEADER', key = '7',     action = act.ActivateTab(6) },
  { mods = 'LEADER', key = '8',     action = act.ActivateTab(7) },
  { mods = 'LEADER', key = '9',     action = act.ActivateTab(8) },

  { mods = 'LEADER', key = 'n',     action = act.ActivateTabRelative(1)  },
  { mods = 'LEADER', key = 'p',     action = act.ActivateTabRelative(-1) },
  { mods = 'LEADER', key = 'z',     action = act.TogglePaneZoomState },
  { mods = 'LEADER', key = 'Space', action = act.QuickSelect },

  {
    mods = 'LEADER',
    key = 'c',
    action = act.SpawnCommandInNewTab {
      domain = 'DefaultDomain',
      cwd    = wezterm.home_dir,
    },
  },
  {
    mods = 'LEADER',
    key = '[',
    action = act.ActivateCopyMode,
  },
  {
    mods = 'LEADER',
    key  = ',',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function (window, _, line)
        if not line then
          return
        end

        window:active_tab():set_title(line)
      end),
    }
  },
  { -- rename workspace
    mods = 'LEADER',
    key  = '$',
    action = act.PromptInputLine {
      description = 'Enter new name for workspace',
      action = wezterm.action_callback(function (_, _, line)
        if not line then
          return
        end

        wezterm.mux.rename_workspace(
          wezterm.mux.get_active_workspace(),
          line
        )
      end),
    }
  },
  { -- show workspace list
    mods = 'LEADER',
    key  = 's',
    -- action = act.ShowLauncherArgs {
    --   title = 'Select Workspace',
    --   flags = 'WORKSPACES',
    -- }
    action = wezterm.action_callback (function (win, pane)
      -- workspace のリストを作成
      local workspaces = {}
      local current = wezterm.mux.get_active_workspace()
      for i, workspace_name in ipairs(wezterm.mux.get_workspace_names()) do
        local indicator = (workspace_name == current) and '(current)' or ''

        table.insert(workspaces, {
          id = workspace_name,
          label = string.format("%2d. %-15s %-10s", i, workspace_name, indicator),
        })
      end
      -- 選択メニューを起動
      win:perform_action(act.InputSelector {
        action = wezterm.action_callback(function (_, _, id, label)
          if not id or not label then
            wezterm.log_info "Workspace selection canceled"  -- 入力が空ならキャンセル
            return
          end

          win:perform_action(act.SwitchToWorkspace { name = id }, pane)  -- workspace を移動
        end),
        title = "Select workspace",
        choices = workspaces,
        fuzzy = false,
        -- fuzzy_description = string.format("Select workspace: %s -> ", current), -- requires nightly build
      }, pane)
    end),
  },
  {
    mods = 'SUPER',
    key = 'p',
    action = act.QuickSelectArgs {
      label = 'open url',
      patterns = {
        'https?://\\S+',
      },
      -- skip_action_on_paste = true, -- nightly only
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        window:perform_action(act.ClearSelection, pane)

        wezterm.log_info('opening: ' .. url)
        wezterm.open_with(url)
      end),
    }
  },

  -- {
  --   mods = 'CTRL|SHIFT',
  --   key  = 'l',
  --   action = wezterm.action_callback(function (window, pane)
  --     window:perform_action(act.ScrollToBottom, pane)

  --     local height = pane:get_dimensions().viewport_rows
  --     -- 実行するたびに不要な行が生成されるため、改行の量を少なくして余分にクリアする
  --     -- プロンプト１個分余計なのでheightから-2する
  --     -- NOTE: winでは改行文字の対応が必要
  --     local blank_viewport = string.rep('\n', height - 2)
  --     pane:inject_output(blank_viewport)

  --     pane:send_text('\x0c') -- CTRL-l
  --     -- pane:send_text('\x0d') -- CTRL-m
  --     -- wezterm.log_info('height: ' .. height)
  --   end),
  -- },
}

config.mouse_bindings = {
  -- Right click sends "woot" to the terminal
  -- {
  --   event = { Down = { streak = 1, button = 'Right' } },
  --   mods = 'NONE',
  --   action = act.SendString 'woot',
  -- },

  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
}

-- config.key_tables = {
  -- copy_mode = {
  --   { key = 'Backspace', action = act.CopyMode 'ClearPattern' },
  -- },
--   activate_pane = {
--     { key = 'LeftArrow',  action = act.ActivatePaneDirection 'Left' },
--     { key = 'h',          action = act.ActivatePaneDirection 'Left' },

--     { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
--     { key = 'l',          action = act.ActivatePaneDirection 'Right' },

--     { key = 'UpArrow',    action = act.ActivatePaneDirection 'Up' },
--     { key = 'k',          action = act.ActivatePaneDirection 'Up' },

--     { key = 'DownArrow',  action = act.ActivatePaneDirection 'Down' },
--     { key = 'j',          action = act.ActivatePaneDirection 'Down' },

--     -- Cancel the mode by pressing escape
--     { key = 'Escape',     action = 'PopKeyTable' },
--   },
-- }


-- ====================
-- ### Plugins ###
-- ====================
local function plug (plugin_name)
  local plugins_dir = 'file:///Users/takuma/.local/share/wezterm/plugins/'
  return wezterm.plugin.require(plugins_dir .. plugin_name)
end



return config

