# Personal Cheat Sheet for NeoVim <br/> <small>(plugins included)</small>

---

|     | Neovim |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | :       | Enter Ex commands |
|     |  N   | q:      | Open the command-line window |
|     |  N   | gQ      | Switch to Ex mode |
|     |  N   | /       | Search forward for the occurrence of a pattern |
|     |  N   | ?       | Search backwards for the occurrence of a pattern |
|     |  N   | n       | Repeat the latest `/` or `?` |
|     |  N   | N       | Repeat the latest `/` or `?` in opposite direction |
|     |  N   | *       | Search forward for the occurrence of the word nearest the cursor |
|     |  N   | #       | Like `*` but backwards |
|     |  N   | g\*     | Like `*` but without word-boundaries (`\<` and `\>`) |
|     |  N   | g#      | Like `#` but without word-boundaries (`\<` and `\>`) |
| §   |  N   | λ␣      | Stop the highlighting for the last search |
|     |  N   | u       | Undo one change |
|     |  N   | C-r     | Redo previous change that was undone |
| §   |  NT  | C-h     | Go to the window to the left of the current one |
| §   |  NT  | C-l     | Go to the window to the right of the current one |
| §   |  NT  | C-j     | Go to the window below the current one |
| §   |  NT  | C-k     | Go to the window above the current one |
| §   |  N   | C-Left  | Decrease the width of the current window |
| §   |  N   | C-Right | Increase the width of the current window |
| §   |  N   | C-Up    | Decrease the height of the current window |
| §   |  N   | C-Down  | Increase the height of the current window |
| §ρ  |  N   | M-h     | Go to the previous buffer |
| §ρ  |  N   | M-l     | Go to the next buffer |
| §ρ  |  N   | M-Left  | Move current buffer to the left in the buffer line |
| §ρ  |  N   | M-Right | Move current buffer to the right in the buffer line |
| §ρ  |  N   | λbd     | Unload the current buffer and delete it from the buffer list |
| §ρ  |  N   | λbD     | Unload all buffers and empty the buffer list |
| §ρ  |  N   | λbw     | Like `λbd` but everything about the buffer is lost |
| §ρ  |  N   | M-j     | Go to the previous tab |
| §ρ  |  N   | M-k     | Go to the next tab |
| §   |  N   | λtn     | Create a new tab with the current file opened |
| §   |  N   | λtc     | Create a new empty tab |
| §   |  NV  | λdd     | Duplicate the line/selection below it |
| §   |  NV  | λdD     | Duplicate the line/selection above it |
| §   |  N   | λs      | Toggle spell checking |
| §ρ  |  N   | λu      | Open the mundo window |
| §ρ  |  N   | λcs     | Start the Markdown Composer preview server |
| §ρ  |  N   | λe      | Toggle the NvimTree window |
| §ρ  |  N   | C-p     | Open Telescope's find_files |
| §ρ  |  N   | λtg     | Open Telescope's live_grep |
| §ρ  |  N   | λmks    | Make/write a global session file with MiniSessions |
| §   |  V   | A-S-j   | Move the selected lines one line down |
| §   |  V   | A-S-k   | Move the selected lines one line up |
| §   |  T   | \<Esc>  | Return to normal mode |
| ρ   |  NIT | C-\\    | Toggle terminal |

---

|     | Comment |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | gcc     | Toggle line comment |
|     |  N   | gbc     | Toggle block comment |
|     |  NV  | gcθ     | Line comment a text object or the current selection |
|     |  NV  | gbθ     | Block comment a text object or the current selection |
|     |  N   | gco     | Create and comment a new line below the current one |
|     |  N   | gcO     | Create and comment a new line above the current one |
|     |  N   | gcA     | Add a comment at the end of the current line |
| §   |  NV  | gdc     | Duplicate and comment the current line/selection |

---

|     | Autopairs |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  I   | C-w     | Delete a pair if possible |
|     |  I   | M-e     | Activate fast wrap |

---

|     | Mundo |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | \<CR>   | Go back to the selected undo state |
|     |  N   | o       | Go back to the selected undo state |
|     |  N   | j       | Move to the previous undo state |
|     |  N   | k       | Move to the next undo state |
|     |  N   | \<Down> | Move to the previous undo state |
|     |  N   | \<Up>   | Move to the next undo state |
|     |  N   | J       | Move to the previous written undo state |
|     |  N   | K       | Move to the next written undo state |
|     |  N   | gg      | Move to the latests undo state |
|     |  N   | G       | Move to the oldest undo state |
|     |  N   | P       | Replay all the changes between the current undo state and the target one |
|     |  N   | d       | Show a vertical diff between the current state and the undo state |
|     |  N   | r       | Show a diff in the preview window |
|     |  N   | i       | Toggle inline diff mode |
|     |  N   | /       | Search for the pattern inside the undo states |
|     |  N   | n       | Repeat the latest `/` |
|     |  N   | N       | Repeat the latest `/` in opposite direction |
|     |  N   | p       | Show a diff between the current undo state and the selected one in the preview window |
|     |  N   | ?       | Toggle a help message with the shortcuts |
|     |  N   | q       | Close the undo graph |

---

|     | vim-surround |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | ds◎     | Delete surroundings |
|     |  N   | cs◎þ    | Change surroundings |
|     |  N   | cS◎þ    | Change surroundings, placing the surrounded text on its own line(s) |
|     |  N   | ysθþ    | Wraps the Vim motion or text object |
|     |  N   | yssþ    | Like `ys` but operates on the current line, ignoring leading whitespaces |
|     |  N   | ySθþ    | Wraps the Vim motion or text object, placing the surrounded text on its own line(s) |
|     |  N   | ySSþ    | Like `yS` but operates on the current line, ignoring leading whitespaces |
|     |  V   | Sþ      | Wraps the current selection. In linewise visual mode, the surroundings are placed on separate lines an indented. In blockwise visual mode, each line is surrounded. |
|     |  V   | gSþ     | Like `S` but with the automated indenting suppressed |

◎ (Surround-target)
: 
- `(`, `)`, `{`, `}`, `[`, `]`, `<`, `>` represents themselves, with the
  opening symbol trimming inner whitespace.
- `b`, `B`, `r`, and `a` are aliases for `)`, `}`, `]`, and `>`.
- `'`, `"` , ` , represent themselves.
- A `t` is a pair of HTML/XML tags.
- The letters `w`, `W`, `s`, and `p` correspond to a `word`, a `WORD`, a
  `sentence`, and a `paragraph`, respectively.

þ (Surround-replacements)
: 
- `(`, `)`, `{`, `}`, `[`, `]`, `<`, `>` represents themselves, with the
  opening symbols inserting an additional whitespace to the inside.
- `b`, `B`, `r`, and `a` are aliases for `)`, `}`, `]`, and `>`.
- `'`, `"` , ` , represent themselves.
- `<C-}>` adds braces on lines separate from the content.
- `t` or `<` wrap the selection/text inside a HTML/XML tag.
- `<C-t>` add a HTML/XML tag on lines separate from the content.
- `f`, `F` or `<C-f>` wraps the text/selection on a function call, with `c-f`
  inserting the function name inside the parentheses.

---

|     | nvim-tree |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | g?      | Toggle the help UI with keybindings |
|     |  N   | q       | Close the tree |
|     |  N   | k       | Move to the previous entry in the tree |
|     |  N   | j       | Move to the next entry in the tree |
|     |  N   | \<CR>   | On the root folder will cd into the above directory |
|     |  N   | C-]     | Will cd into the directory under the cursor |
|     |  N   | \<BS>   | Will close current opened directory or parent |
|     |  N   | P       | Will move cursor to the parent directory |
|     |  N   | a       | Create a new entry |
|     |  N   | r       | Rename an entry |
|     |  N   | C-r     | Like `r` but omit the filename on the prompt |
|     |  N   | x       | Add/remove entry to cut clipboard |
|     |  N   | c       | Add/remove entry to copy clipboard |
|     |  N   | p       | Paste from clipboard\*  |
|     |  N   | d       | Delete an entry |
|     |  N   | D       | Trash an entry |
|     |  N   | y       | Copy the entry's name |
|     |  N   | Y       | Copy the entry's path |
|     |  N   | gy      | Copy the entry's absolute path |
|     |  N   | [c      | Jump to the previous git item |
|     |  N   | ]c      | Jump to the next git item |
|     |  N   | -       | Navigate up one directory |
|     |  N   | s       | Open a file with the default system application or a folder with the default file manager |
|     |  N   | <       | Navigate to the previous sibling of current entry |
|     |  N   | >       | Navigate to the next sibling of current entry |
|     |  N   | J       | Navigate to the first sibling of current entry |
|     |  N   | K       | Navigate to the last sibling of current entry |
|     |  N   | C-e     | Edit the file in place, effectively replacing the tree explorer |
|     |  N   | \<CR>   | On an entry: if a directory, open it. If a file, open it in the buffer near the tree. If a symlink, follow it |
|     |  N   | o       | Like `<CR>` on an entry |
|     |  N   | O       | Like `o` but don't ask on what buffer to open the file |
|     |  N   | C-v     | Open the file in a vertical split |
|     |  N   | C-x     | Open the file in a horizontal split |
|     |  N   | C-t     | Open the file in a new tab |
|     |  N   | \<Tab>  | Open the file as preview\*\* |
|     |  N   | I       | Toggle visibility of files/directories hidden via *__git.ignore__* option |
|     |  N   | H       | Toggle visibility of dotfiles |
|     |  N   | U       | Toggle visibility of files/directories hidden via *__filters.custom__* option |
|     |  N   | R       | Refresh the tree |
|     |  N   | W       | Collapse the whole tree |
|     |  N   | S       | Search for a path and then expands the tree to match the path |
|     |  N   | .       | Enter vim command mode with the file the cursor is on |
|     |  N   | C-k     | Toggle a popup with information about the entry under the cursor |
| §   |  N   | l       | Like `<CR>` on an entry |
| §   |  N   | h       | Like `<BS>` |

*
: Cut clipboard has precedence over copy (will prompt for confirmation)

**
: Keep the cursor in the tree

---

|     | gitsigns |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | [c      | Jump to the previous hunk in the current buffer |
|     |  N   | ]c      | Jump to the next hunk in the current buffer |
|     |  NV  | λhs     | Stage the hunk at the cursor position |
|     |  N   | λhS     | Stage all hunks in current buffer |
|     |  NV  | λhr     | Reset the lines of the hunk at the cursor position |
|     |  N   | λhR     | Reset the lines of all hunks in the buffer |
|     |  N   | λhu     | Undo the last call of stage_hunk() |
|     |  N   | λhp     | Preview the hunk at the cursor position in a floating window |
|     |  N   | λhb     | Toggle current line blame popup |
|     |  N   | λtb     | Toggle a blame annotation at the end of the current line |
|     |  N   | λhd     | Show a vertical diff of the current buffer against the index |
|     |  N   | λhD     | Show a vertical diff of the current buffer against the HEAD |
|     |  N   | λtd     | Show the old version of hunks inline in the buffer |
|     |  N   | λtw     | Highlight intra-line word differences in the buffer |
|     |  N   | λhq     | Populate the quickfix list with hunks. Automatically opens the quickfix window |
|     |  N   | λhl     | Populate the location list with hunks. Automatically opens the location list window |

ih
: A custom __*text object*__ representing the hunk at the cursors position

---

|     | nvim-lsp-installer |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | \<CR>   | Expand information about the server under the current cursor position |
|     |  N   | i       | Install the server under the current cursor position |
|     |  N   | u       | Reinstall/update the server under the current cursor position |
|     |  N   | c       | Check for new version of the server under the current cursor position |
|     |  N   | U       | Update all installed servers |
|     |  N   | i       | Uninstall the server under the current cursor position |

---

|     | lspconfig |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
| §   |  N   | [d      | Jump to the previous diagnostic in the current buffer |
| §   |  N   | ]d      | Jump to the next diagnostic in the current buffer |
| §   |  N   | λsd     | Show the diagnostic at the cursor position in a floating window |
| §   |  N   | λsD     | List all diagnostic messages for the current buffer in the location list window |
| §   |  N   | gd      | Jump to the definition of the symbol under the cursor |
| §   |  N   | gD      | Jump to the declaration of the symbol under the cursor |
| §   |  N   | gi      | Lists all the implementations for the symbol under the cursor in the quickfix window |
| §   |  N   | gr      | Lists all the references to the symbol under the cursor in the quickfix window |
| §   |  N   | K       | Displays hover information about the symbol under the cursor in a floating window |
| §   |  N   | C-q     | Displays signature information about the symbol under the cursor in a floating window|
| §   |  N   | λtD     | Jumps to the definition of the type of the symbol under the cursor |
| §   |  N   | λrn     | Rename all references to the symbol under the cursor |
| §   |  N   | λca     | Selects a code action available at the current cursor position |
| §   |  N   | λff     | Format the current buffer |

---

|     | jdtls |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
| §   |  NV  | λoi     | Organize imports |
| §   |  NV  | λxv     | Extract value/selection under the cursor as a variable |
| §   |  NV  | λxc     | Extract value/selection under the cursor as a constant |
| §   |  NV  | λxm     | Extract selection as a method |

---

|     | treesitter |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
| §   |  N   | gnn     | Start incremental selection |
| §   |  V   | gnm     | Increment to the upper named parent |
| §   |  V   | gnk     | Increment to the upper scope |
| §   |  V   | gnj     | Decrement to the previous named node |

---

|     | cmp |||
|     | Mode | Keymap   | Description |
| :-  | :-:  | :-:      | :-          |
| §   |  IC  | C-k      | Select previous item |
| §   |  IC  | C-j      | Select next item |
| §   |  IC  | C-b      | Scroll docs down |
|     |  IC  | C-f      | Scroll docs up |
| §   |  IC  | C-e      | Close the completion menu |
|     |  IC  | C-␣      | Show completing menu |
|     |  IC  | \<CR>    | Accept the currently selected item. If none is selected, then select the first item |
| §   |  IC  | S-\<TAB> | Select previous item or jump to previous snippet group |
| §   |  IC  | \<TAB>   | Select next item or jump to next snippet group |

---

|     | Telescope |||
|     | Mode | Keymap      | Description |
| :-  | :-:  | :-:         | :-          |
|     |  N   | ?           | Display the keymaps of registered actions |
|     |  N   | \<Esc>      | Close the Telescope window |
|     |  N   | k           | Same as \<Up> |
|     |  N   | j           | Same as \<Down> |
|     |  N   | H           | Move to the top of the picker |
|     |  N   | M           | Move to the middle of the picker |
|     |  N   | L           | Move to the bottom of the picker |
|     |  N   | gg          | Same as `H` |
|     |  N   | G           | Same as `L` |
|     |  NI  | \<Up>       | Move the selection to the previous entry |
|     |  NI  | \<Down>     | Move the selection to the next entry |
|     |  NI  | \<CR>       | Perform default action on selection (eg: `:edit <selection>`) |
|     |  NI  | C-x         | Perform 'horizontal' action on selection (eg: `:new <selection>`) |
|     |  NI  | C-v         | Perform 'vertical' action on selection (eg: `:vnew <selection>`) |
|     |  NI  | C-t         | Perform 'tab' action on selection (eg: `:tabedit <selection>`) |
|     |  NI  | C-u         | Scroll the preview window up |
|     |  NI  | C-d         | Scroll the preview window down |
|     |  NI  | \<PageUp>   | Scroll the results window up |
|     |  NI  | \<PageDown> | Scroll the results window down |
|     |  NI  | \<Tab>      | Toggle current entry status for multi-select and move the selection to the entry that has a worse score |
|     |  NI  | S-\<Tab>    | Toggle current entry status for multi-select and move the selection to the entry that has a better score |
|     |  NI  | C-q         | Sends all entries to the quickfix list and open it |
|     |  NI  | M-q         | Sends the selected entries to the quickfix list and open it |
|     |  I   | C-h         | Display the keymaps of registered actions |
|     |  I   | C-c         | Close the Telescope window |
|     |  I   | C-k         | Same as \<Up> |
|     |  I   | C-j         | Same as \<Down> |
|     |  I   | C-p         | Cycle to the previous search prompt in the history |
|     |  I   | C-n         | Cycle to the next search prompt in the history |
|     |  I   | C-l         | Open completion menu containing the tags which can be used to filter the results in a faster way |

---

|     | mini.starter |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | \<Up>   | Move to the previous item |
|     |  N   | \<Down> | Move to the next item |
|     |  N   | C-p     | Same as `<Up>` |
|     |  N   | C-n     | Same as `<Down>` |
|     |  N   | M-k     | Same as `<Up>` |
|     |  N   | M-j     | Same as `<Down>` |
|     |  N   | \<CR>   | Executes action of current item |
|     |  N   | C-c     | Closes the starter buffer |

---

|     | mini.indentscope |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
|     |  N   | [i      | Navigate to the header of the current indent scope |
|     |  N   | ]i      | Navigate to the footer of the current indent scope |

ii
: A custom __*text object*__ representing the current indent scope, no borders included |

ai
: A custom __*text object*__ representing the current indent scope, borders included |

---

|     | Plugin |||
|     | Mode | Keymap  | Description |
| :-  | :-:  | :-:     | :-          |
| §   |  N   |         |             |

---

λ
: \<Leader> key.

§
: Non-standard for NeoVim or the plugin.

ρ
: Plugin.

θ
: A text object like `aw`, `is`, `)`, and `ap`; or a Vim motion like `j` or `l`.
