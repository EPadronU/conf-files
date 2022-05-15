local status_ok, starter = pcall(require, "mini.starter")

if not status_ok then
  return
end

-- https://github.com/goolord/alpha-nvim/blob/main/doc/alpha.txt
local header_art = [[
                               __
  ___     ___    ___   __  __ /\_\    ___ ___    
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
]]

-- https://onlineasciitools.com/convert-text-to-ascii-art | Ogre
local footer_art = [[
                   _                      __             _        _              
                  | |__   _   _        /\ \ \  ___    __| |__  __(_) _ __    ___ 
                  | '_ \ | | | |      /  \/ / / _ \  / _` |\ \/ /| || '_ \  / _ \
                  | |_) || |_| |     / /\  / | (_) || (_| | >  < | || | | ||  __/
                  |_.__/  \__, |     \_\ \/   \___/  \__,_|/_/\_\|_||_| |_| \___|
                          |___/
]]

starter.setup {
  -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
  -- started with intent to show something else
  autoopen = true,

  -- Whether to evaluate action of single active item
  evaluate_single = true,

  -- Items to be displayed. Should be an array with the following elements:
  -- - Item: table with <action>, <name>, and <section> keys.
  -- - Function: should return one of these three categories.
  -- - Array: elements of these three types (i.e. item, array, function).
  -- If `nil` (default), default items will be used (see |mini.starter|).
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(5, true, false),
    starter.sections.recent_files(5, false, true),
    starter.sections.sessions(10, true),
    starter.sections.telescope(),
  },

  -- Header to be displayed before items. Converted to single string via
  -- `tostring` (use `\n` to display several lines). If function, it is
  -- evaluated first. If `nil` (default), polite greeting will be used.
  header = header_art,

  -- Footer to be displayed after items. Converted to single string via
  -- `tostring` (use `\n` to display several lines). If function, it is
  -- evaluated first. If `nil` (default), default usage help will be shown.
  footer = footer_art,

  -- Array  of functions to be applied consecutively to initial content.
  -- Each function should take and return content for 'Starter' buffer (see
  -- |mini.starter| and |MiniStarter.content| for more details).
  content_hooks = {
    starter.gen_hook.adding_bullet("❯ "),
    starter.gen_hook.indexing("all", { "Builtin actions", "Sessions", "Telescope" }),
    starter.gen_hook.aligning("center", "center"),
  },

  -- Characters to update query. Each character will have special buffer
  -- mapping overriding your global ones. Be careful to not add `:` as it
  -- allows you to go into command mode.
  query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
}
