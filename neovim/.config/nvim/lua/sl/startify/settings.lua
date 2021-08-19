vim.g.startify_session_dir = '~/.config/nvim/session'

-- vim.g.startify_custom_header = [[
-- '                     __    ____________________'
-- '   _________  ____  / /__ <  /__  / ____/ ____/'
-- '  / ___/ __ \/ __ \/ / _ \/ /  / /___ \/___ \  '
-- ' (__  ) /_/ / / / / /  __/ /  / /___/ /___/ /  '
-- '/____/\____/_/ /_/_/\___/_/  /_/_____/_____/   '
-- '                                               '
-- ]]

vim.g.startify_lists = {
  { type = 'sessions',  header = { '   Sessions' }       },
  { type = 'bookmarks', header = { '   Bookmarks' }      },
  { type = 'files',     header = { '   MRU' }            },
  -- { type = 'dir',       header = { '   MRU '. getcwd() } },
}
