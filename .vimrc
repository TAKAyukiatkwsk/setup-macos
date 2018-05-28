"============================
" dein.vim {{{
"============================
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
    call dein#begin('~/.vim/bundles')

    call dein#add('~/.vim/bundles')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    
    call dein#add('itchyny/lightline.vim')
    call dein#add('edkolev/tmuxline.vim')

    call dein#add('tpope/vim-obsession')
    call dein#add('TAKAyukiatkwsk/vim-indent-settings')
    call dein#add('thinca/vim-ft-markdown_fold')
    call dein#add('tpope/vim-fugitive')
    call dein#add('sjl/badwolf')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
" }}}

"============================
" neobundle.vim {{{
"============================
"if has('vim_starting')
"    set nocompatible            " Be iMproved
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"
"call neobundle#begin(expand('~/.vim/bundle/'))
"
"" NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"" Misc
"NeoBundle 'Shougo/vimproc.vim', {
"    \ 'build' : {
"    \     'windows' : 'make -f make_mingw32.mak',
"    \     'cygwin' : 'make -f make_cygwin.mak',
"    \     'mac' : 'make -f make_mac.mak',
"    \     'unix' : 'make_unix.mak',
"    \   },
"    \ }
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'edkolev/tmuxline.vim'
"NeoBundle 'tpope/vim-obsession'
"
"
"" Syntax
"NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'tpope/vim-rails'
"NeoBundle 'TAKAyukiatkwsk/vim-mongoid-syntax'
"NeoBundle 'helino/vim-json'
"NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'nginx.vim'
"NeoBundle 'rodjek/vim-puppet'
"NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'burnettk/vim-angular'
"NeoBundle 'derekwyatt/vim-scala'
"NeoBundle 'gre/play2vim'
"NeoBundle 'derekwyatt/vim-sbt'
"NeoBundle 'othree/html5.vim'
"NeoBundle 'Keithbsmiley/swift.vim'
"NeoBundle 'pearofducks/ansible-vim'
"" Syntax checking
"NeoBundle 'scrooloose/syntastic'
"" Checking coding style
"NeoBundle 'editorconfig/editorconfig-vim'
"
"" Indent
"NeoBundle 'TAKAyukiatkwsk/vim-indent-settings'
"
"" Folding
"NeoBundle 'thinca/vim-ft-markdown_fold'
"
"" Git
"NeoBundle 'tpope/vim-fugitive'
"
"" Gist
"NeoBundle 'mattn/webapi-vim'
"NeoBundle 'mattn/gist-vim'
"
"" Clipboard
"NeoBundle 'kana/vim-fakeclip'
"
"" Colorscheme
"NeoBundle 'sjl/badwolf'
"
"call neobundle#end()
"
"filetype plugin indent on   " Required!
" }}}

"============================
" indent {{{
"============================
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" }}}

"============================
" buffer settings {{{
"============================
set number
" Show pair bracket
set showmatch
set encoding=utf-8
" ステータスラインを常に表示する
set laststatus=2
" カーソルの位置を表示する
set ruler
" Syntax highlight
syntax enable
" tab charcter highlighting
augroup highlightTab
    autocmd!
    autocmd ColorScheme * highlight Tab term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match Tab /	/
augroup END

" file type
autocmd BufRead,BufNewFile nginx.conf setlocal filetype=nginx

colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 2

set t_Co=256
" Available MacOS X clipboard
set clipboard=unnamed
" search highlight
set hlsearch
" }}}

"============================
" key mapping {{{
"============================
if ($KEYBOARD == 'us')
    " In case of US keyboard
    noremap ; :
    noremap : ;
endif

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
" edit and source .vimrc
nnoremap <Space> :<C-u>split $MYVIMRC<CR>
nnoremap <Space>s :<C-u>source $MYVIMRC<CR>
" }}}

"============================
" neocomplete {{{
"============================
let g:deoplete#enable_at_startup = 1

"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1

" plugin key-mappings
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB>    neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB>    neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" key-mappings
"inoremap <expr><CR>     neocomplete#smart_close_popup() . "\<CR>"
"inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h>    neocomplete#smart_close_popup() . "\<C-h>"
"inoremap <expr><BS>     neocomplete#smart_close_popup() . "\<C-h>"
"inoremap <expr><C-y>    neocomplete#close_popup()
"inoremap <expr><C-e>    neocomplete#cancel_popup()

" For snippet_complete marker
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" disable preview window
set completeopt-=preview

" rsense
let g:rsenseHome = expand('$RSENSE_HOME')   " .zshrcなどで$RSENSE_HOMEを定義しておく
let g:rsenseUseOmniFunc = 1 

"if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" }}}

"============================
" gist-vim {{{
"============================
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_get_multiplefile = 1
" Only :w! updates a gist.
let g:gist_update_on_write = 2    
" }}}

"============================
" quickrun {{{
"============================
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
    \ 'type': 'markdown/pandoc',    
    \ 'outputter': 'browser',
    \ 'cmdopt': '-s'
    \}
let g:quickrun_config['mkd'] = g:quickrun_config['markdown']
" }}}

"============================
" syntastic {{{
"============================
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript', 'php', 'ruby'],
                           \ 'passive_filetypes': [] }
" }}}

"============================
" unite.vim {{{
"============================
"nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> fb :<C-u>Unite buffer<CR>
"nnoremap <silent> fu :<C-u>Unite neobundle/update -log -wrap -auto-quit<CR>
"nnoremap <silent> ft :<C-u>Unite tab<CR>
"let g:unite_split_rule = "rightbelow"
"let g:unite_winheight = 10
"
"call unite#custom#profile('files', 'context', {
"    \ 'start_insert' : 1,
"    \ 'prompt_direction' : 'top',
"    \ 'ignorecase' : 1
"    \ })
" }}}

"============================
" tmuxline {{{
"============================
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
let g:tmuxline_preset = {
    \'a'       : '#S',
    \'b'       : '#W',
    \'c'       : '',
    \'win'     : '#I > #W',
    \'cwin'    : '#I-#P > #W',
    \'x'       : '',
    \'y'       : '%F < %R',
    \'z'       : '#H',
    \'options' : {'status-justify' : 'left'}}
let g:tmuxline_theme = 'iceberg'
" }}}

"============================
" folding {{{
"============================
set foldmethod=manual
autocmd FileType ruby :setlocal foldmethod=indent
autocmd FileType ruby :setlocal foldlevel=1
autocmd FileType ruby :setlocal foldnestmax=6
autocmd FileType vim  :setlocal foldmethod=marker
autocmd FileType git :setlocal foldlevel=99
autocmd FileType javascript :syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
autocmd FileType javascript :setlocal foldmethod=syntax foldlevel=1
autocmd FileType scala :setlocal foldmethod=indent
autocmd FileType scala :setlocal foldlevel=1
autocmd FileType scala :setlocal foldnestmax=6
" }}}

"============================
" kobito.app {{{
"============================
" reference: http://qiita.com/Linda_pp/items/ec458977a6552050855b
function! s:open_kobito()
    if a:0 == 0
        call system('open -a Kobito '.expand('%:p'))
    else
        call system('open -a Kobito '.join(a:000, ' '))
    endif
endfunction

command! -nargs=* Kobito call s:open_kobito(<f-args>)
command! -nargs=0 KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")
command! -nargs=0 KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")
" }}}
