# vim

## Usage

```bash

```bash
git clone git@github.com:Yescafe/vim.git $HOME/.vim
```

then run `:PlugInstall` in vim.

## Keys

Leader is space. `kj` maps to Esc.

Basic:

```
<leader>qq: quit this window
<leader>qQ: quit all
```

Motions:

```
J: move down 5 times
K: move up 5 times
H: move left 5 times
L: move right 5 times
U: half page up, equivalent to Ctrl-u
D: half page down, equivalent to Ctrl-d
s: easymotion find 1 letter
<leader>mf: easymotion find 2 letters
<leader>ml: easymotion goto line
<leader>mw: easymotion goto word
```

Edit:

```
Meta-backspace: delete forward a word (left is forward direction?)
<leader>u: toggle undo tree and focus
<leader>/: comment/uncomment
```

File(f):

```
<leader>ff: edit a file, open in this window>
<leader>fs: save this buffer
<leader>fS: source vimrc
<leader><f4>: source vimrc
<leader>fd: toggle nerd tree
```

Toggle(t):

```
<leader>ti: show invisible characters
<leader>tt: switch indent width between 2 and 4 (default is 4)
<leader>tT2: switch indent width into 2
<leader>tT4: switch indent width into 4
<leader>tl: highlight column 81
<leader>tc: tag bar
<leader>tm: markdown table mode
```

Search(s):

```
<leader>sc: turn search highlights off
```

Windows manage(w):

```
<leader>wv: split a window below and focus
<leader>wV: split a window below but not focus
<leader>ws: split a window right and focus
<leader>wS: split a window right but not focus
<leader>w[hjkl]: focus window by direction modifier
[<up><down><left><right>]: focus window by direction modifier
<leader>w[+=]: increase vertical window size
<leader>w-: decrease vertical window size
Shift-<down>: increase vertical window size
Shift-<up>: decrease vertical window size
<leader>w>: increase horizontal window size
<leader>w<: decrease horizontal window size
Shift-<right>: increase horizontal window size
Shift-<left>: decrease horizontal window size
```

Buffers(b):

```
<leader>B: list buffers
<leader>bb: switch to any buffer
<leader>bh: switch to previous buffer
<leader>bl: switch to next buffer
<leader>bH: switch to first buffer
<leader>bL: switch to last buffer
<leader>bk: kill this buffer
<leader>br: rewind this buffer
```

Tabs(j):

```
<leader>jn: new empty tab
<leader>jf: new tab with open-file
<leader>jh: switch to previous tab
<leader>jl: switch to next tab
```

Docs(d):

```
<leader>dd: coc show documentation
```

