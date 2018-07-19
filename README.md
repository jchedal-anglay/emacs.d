# Emacs configuration based on Evil


## Requirements
- Emacs **GUI**, preferably 26+
- Inconsolata


## Getting started
Simply clone the repository into your home directory.


## Bindings
The leader key in that configuration is the spacebar (`SPC`), we will refer to it as `<leader>` from now on.

### Normal mode
*`<leader><leader>`: Open a buffer containing all the usable function in the current mode

### Non-normal mode
*`<leader><leader>`: Return to Normal mode, similar to vim's `<esc>`

### Insert mode
*`<shift>-<leader>`: Toggle autocomplete

### Non-insert mode
*`H`: Go to first non-whitespace character of current line
*`J`: Go to next blank line
*`K`: Go to previous blank line
*`L`: Go to end of current line

### Buffer -> `b`
*`<leader>bb`: Display buffers, recent files, current directory in a small buffer
*`<leader>bg`: Use `grep` on the current buffer

### Files -> `f`
*`<leader>ff`: Stands for `find-files`, navigate through your files and directories
*`<leader>fg`: Find a file or directory using locate
*`<leader>fq`: Quit the current buffer, similar to vim's `:q`
*`<leader>fs`: Save the current buffer, similar to vim's `:w`
*`<leader>fx`: Save and quit the current buffer, similar to vim's `:wq`

### Git -> `g`
*`<leader>gb`: `git checkout`
*`<leader>gc`: `git commit`
*`<leader>gg`: Open a dedicated buffer that serves as an interface to git
*`<leader>gi`: `git init`
*`<leader>gm`: `git merge`
*`<leader>gp`: `git push`
*`<leader>gs`: Stage all the current changes
*`<leader>gu`: Unstage all the previously staged changes

### Project -> `p`
*`<leader>pf`: Find a file or directory within a project
*`<leader>pg`: Use `grep` on entire project
*`<leader>pp`: Open a dedicated buffer that serves as an interface for project management tools

### Windows -> `w`
*`<leader>w[hjkl]`: Go to left/bottom/upper/right window
*`<leader>w[np]`: Go to next/previous window
*`<leader>w[sv]`: Split the buffer horizontally/vertically
