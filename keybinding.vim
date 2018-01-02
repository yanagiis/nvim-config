" key binding

" Map leader to space
let mapleader=' '
nmap <leader><space>w <Plug>(easymotion-bd-w)
nmap <leader><space>f <Plug>(easymotion-bd-f)
nmap <leader><space>l <Plug>(easymotion-bd-jk)

" (B)uffer
nmap <leader>bb :Buffers<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bn :bn<CR>
nmap <leader>bc :bd<CR>

" (C)onfig
nmap <leader>cc :edit ~/.config/nvim/init.vim<CR>
nmap <leader>ck :edit ~/.config/nvim/keybinding.vim<CR>
nmap <leader>cr :source ~/.config/nvim/init.vim<CR>

" (F)ile
nmap <leader>fs :w<CR>
nmap <leader>fg :Rgrep<CR>
" nmap <leader>ff :FZF<CR>
nmap <leader>ff :FuzzyOpen<CR>
nmap <leader>fo :Neoformat<CR>

" (H)ighlight
nmap <leader> :hl<CR>

" (S)hell and session
if g:vim_bootstrap_editor == 'nvim'
  nmap <silent> <leader>sh :terminal<CR>
else
  nmap <silent> <leader>sh :VimShellCreate<CR>
endif

nmap <leader>so :OpenSession<Space>
nmap <leader>ss :SaveSession<Space>
nmap <leader>sd :DeleteSession<CR>
nmap <leader>sc :CloseSession<CR>

" (G)it
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>gv :Gitv<CR>

" (L)anguage
augroup go
  " vim-go
  au FileType go nmap <Leader>ld <Plug>(go-def-vertical)
  au FileType go nmap K <Plug>(go-doc-vertical)
  " au FileType go nmap <Leader>lb <Plug>(go-doc-browser)

  au FileType go nmap <leader>lr  <Plug>(go-run)
  au FileType go nmap <leader>lt  <Plug>(go-test)
  au FileType go nmap <Leader>lgt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>li <Plug>(go-info)
  au FileType go nmap <silent> <Leader>ll <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go nmap <leader>lrb :<C-u>call <SID>build_go_files()<CR>
augroup END

  " jedi-vim
  let g:jedi#goto_assignments_command = "<leader>lg"
  let g:jedi#goto_definitions_command = "<leader>ld"
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>ln"
  let g:jedi#rename_command = "<leader>lr"
  let g:jedi#completions_command = "<C-Space>"

augroup rust
  autocmd!
  au FileType rust nmap <leader>ld zp<Plug>(rust-def)
  au FileType rust nmap <C-t> zP
  " au FileType rust nmap gs <Plug>(rust-def-split)
  " au FileType rust nmap gx <Plug>(rust-def-vertical)
  au FileType rust nmap <leader>K <Plug>(rust-doc)
augroup END

augroup c
  autocmd!
  au FileType c,cpp nmap <leader>ld :DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
  au FileType c,cpp nmap <leader>lc :DeniteCursorWord -buffer-name=gtags_ref gtags_ref<cr>
  au FileType c,cpp nmap <leader>ls :Denite -buffer-name=gtags_completion gtags_completion<cr>
  au FileType c,cpp nmap <leader>lf :Denite gtags_def:
  au FileType c,cpp nmap <F12> :call g:ClangUpdateQuickFix()<cr>
augroup END

augroup python
  au FileType python nmap <F12> <Plug>(pydocstring)
augroup END

" (P)lugin
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>

" (W)indow
nmap <leader>wh <C-w>h
nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wl <C-w>l

" Set working directory
nmap <leader>. :lcd %:p:h<CR>

" Function key
nmap <silent> <F1> <ESC>
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :TagbarToggle<CR>
nmap ; :

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
