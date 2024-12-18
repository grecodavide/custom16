vim.o.background = "light"

vim.cmd("silent !kill -SIGUSR1 $(pgrep kitty) &")
package.loaded["custom16"] = nil
package.loaded["custom16.palette"] = nil
require("custom16").set_colors()
