# My custom colorscheme.
## Rationale
I have a script that manages all my tools' palette. For this reason, I wanted a colorscheme
that changed accordingly too. This accomplishes just that, while also never changing
the actual colorscheme: the color "green" will change, but what is displayed as "green" will not.

## How to use
To use this, you have to call setup with a lua path to you palette: if your palette
is in `$XDG_CONFIG_HOME/nvim/lua/config/palette.lua`, then (using lazy.nvim) you would call
```lua
return {
    "https://codeberg.org/davidegreco/custom16",
    lazy = false,
    priority = 1000,
    opts = {
        palette_path = "config.palette",
    },
},
```

Note that this supports hot reloading, so if you change the palette and then
reset the colorscheme, it will change the palette immediately. Here is an example of a palette:
```lua
-- must return the palette
return {
    main = {
        "#141410",
        "#cc241d",
        "#98971a",
        "#d79921",
        "#458588",
        "#b16286",
        "#24837b",
        "#d5c18e",

        "#282828",
        "#792329",
        "#98971a",
        "#d65d0e",
        "#7daea3",
        "#8f3f71",
        "#689d6a",
        "#ebdbb2",
    },
    extras = {
        accent         = "#24837b",
        inactivelinenr = "#877b5b",
        comment = "#746a4f",
        split = "#9b8d67",
        cursorline = "#15221c",
    }
}
```

