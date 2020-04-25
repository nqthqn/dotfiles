# dotfiles
## `tmux`

 - `<prefix>!` break pane to new window, helpful if window is getting crowded

## `vim`
Vim's interface is a programming language made up of movements (`w` `e` `b` `h` `j` `k` `l`), edits (`c`), counts and modifiers (`i` inside, `a` around). [video](https://www.youtube.com/watch?v=a6Q8Na575qc)
I am documenting the motions I am learning in Vim. Disabling the mouse and the arrow keys really helps me learn.

### ??
 - Edit a macro: `"qp` then edit, then `V"qy` to update it.
 - `gf` go into file
 - `^o` go back, `^i` go forward, `:jumps`

### Wed Apr  8 2020
 - `qa` quit all windows
 - `fc` find the first c in a line (variants: `FtT`)
 - `ysiw"` surround word in "quotes", `cs'"` change surrounding `'` to `"` 'like'

### Mon Apr  6 2020
 - `:%g!/^(/d` across the whole file (`%`) run a command (`g`) on any line that does not (`!`) start with `(` (`g!/^(`) — in this case the command is delete (`d`)
 - `:%s/foo/bar/gc` substitute foo for bar across the whole line, prompt for confirmation
 - `r` replace character
 - `J` join line(s), work with visual selection. 
 - `^w v` to split vertically
 - `:registers` list what you have copied
 - `"ayiw` into register a, yank inner word

### Sun Apr  5 2020
 - `I` to insert at start of line, `A` to insert at end of line

### Fri Apr  3 2020
 - `.` repeat last action: `*cw<name><esc>n.n.n.n.` to rename a bunch of stuff
 - `D` delete till end of line
 - `di"` delete in quotes 
 - `%` jump to matching brace, `V%`, visually select until matching brace
 - `x` delete char. better then forward delete, block cursor

### mon mar 30 2020  
- map shortcuts in normal mode `nmap <leader>t gg` 
- `dtt` delete until t
- `gg=g` auto intent a file (sometimes works)
- `]c` and `[c` next and previous git hunk (use with git-gutter plugin)
- `\hs` stage current hunk
- `t` is like `t` but backwards, `dt{` means delete until {
- `f` is like `f` but backwards, `df(` means delete back to ( (inclusive)
- `h`,`m`, `l` high middle low of the screen
- `gg` top of file, `g` bottom of file, `8gg` line 8 of file
- `zz` center screen to cursor
- `^e` scroll down, `^y` scroll up
- `^f` scroll full screen, `^d` scroll have
- nice for macros (`q<slot>`, `q`, `@<slot>`)
- `0` start of line
- `^` first char of line
- `$` end of line
- `g_` last char on line
- `*` search for word that you are currently on
- `u` undo, `^r` redo
- `W` is a big word
- Marks
- `mm` set a mark called m on the line
- backtick `m` to go to mark called m

### Mon Mar 29 2020
- `:r !date` to insert todays date on next line
- `Shift K` shows documentation for the thing under the cursor
- `:h f` taught me about the `f` motion, `f"` takes me to the :ext " on the current line
- `inoremap " ""<left>` maps `"` in insert mode to `""` with the cursor between the `""`
