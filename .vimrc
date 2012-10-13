" vim: set foldmarker={,} foldlevel=0 foldmethod=marker nospell:

" All Bundle {
	" important before vundle {
		set nocompatible
		filetype off
        if has("gui_running")
		    set rtp+=$VIM/bundle/vundle
		    call vundle#rc("$VIM/bundle")
        else
		    set rtp+=~/bundle/vundle
		    call vundle#rc("~/bundle")
        endif
	" }
	Bundle 'tpope/vim-fugitive'
	Bundle 'gmarik/vundle'
	Bundle 'flazz/vim-colorschemes'
	Bundle 'corntrace/bufexplorer'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'matchit.zip'
	Bundle 'tpope/vim-surround'
	Bundle 'scrooloose/nerdtree'
	Bundle 'majutsushi/tagbar'
	Bundle 'msanders/snipmate.vim'
	Bundle 'spf13/PIV'
	Bundle 'kien/ctrlp.vim'
	Bundle 'Shougo/neocomplcache'
	Bundle 'nono/jquery.vim'
	Bundle 'mattn/zencoding-vim'
	Bundle 'Align'
    Bundle 'godlygeek/csapprox'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'airblade/vim-rooter'
	Bundle 'Color-Scheme-Explorer'
	Bundle 'xolox/vim-shell'
	" set filetype {
		filetype plugin on
	" }
" }

" Environment {
	" Encoding {
		set encoding=utf-8
		set fileencodings=utf-8,chinese,latin-1
		set fileencoding=utf-8
	" }
	" Basic {
		set background=dark             " Assume a dark background
		set tabpagemax=15				" only show 15 tabs
		set showmode					" display the current mode
		set backspace=indent,eol,start	" backspace for dummies
		set linespace=0					" No extra spaces between rows
		set nu							" Line numbers on
		set showmatch					" show matching brackets/parenthesis
		set incsearch                   " find as you type search
		set hlsearch                    " highlight search terms
		set winminheight=0              " windows can be 0 line high
		set ignorecase                  " case insensitive search
		set smartcase                   " case sensitive when uc present
		set wildmenu                    " show list instead of just completing
		set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
		set whichwrap=b,s,<,>,[,]		" backspace and cursor keys wrap to
		set scrolljump=5                " lines to scroll when cursor leaves screen
		set scrolloff=3                 " minimum lines to keep above and below cursor
		set foldenable                  " auto fold code
		set foldmethod=manual
		set shiftwidth=4                " use indents of 4 spaces
		"set expandtab                   " tabs are spaces, not tabs
		set tabstop=4                   " an indentation every four columns
		set softtabstop=4               " let backspace delete indent
		set history=1000                " Store a ton of history (default is 20)
		set hidden                      " allow buffer switching without saving
		"set mouse=a
		set listchars=tab:>-,trail:$
		set noswapfile
		set laststatus=2
		let mapleader = ','
		let html_no_rendering=1
		syntax on
		" use space to toggle fold
		nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
		" Remove trailing whitespaces and chars
		autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,vim
			\ autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
		"autocmd! bufwritepost .vimrc source $MYVIMRC " auto read setting when change .vimrc
	" }
	" Common keymap {
		inoremap <unique> <leader>e <ESC>
		inoremap <unique> zz <ESC>
		nnoremap <unique> <leader>c <C-]>
		nnoremap <unique> <leader>ts :ts<CR>
        nnoremap <unique> <c-u> :update<CR>

		" Easier moving in tabs and windows
		nnoremap <unique> <C-j> <C-W>j
		nnoremap <unique> <C-k> <C-W>k
		nnoremap <unique> <C-l> <C-W>l
		nnoremap <unique> <C-h> <C-W>h

		" Wrapped lines goes down/up to next row, rather than next line in file.
		nnoremap <unique> j gj
		nnoremap <unique> k gk

		" Yank from the cursor to the end of the line, to be consistent with C and D.
		nnoremap <unique> Y y$

		" Shortcuts
		" Change Working Directory to that of the current file
		cnoremap <unique> cwd lcd %:p:h
		cnoremap <unique> cd. lcd %:p:h
	" }
	" For gui special setting {
		if has('gui_running')
			language messages en_US
			set guifont=Courier_New:h12:cANSI
			set guioptions-=T "hide toolbar
			set guioptions-=m "hide menubar
			colo vj
			nnoremap <unique> <F3> :vi $VIM/.vimrc<CR>
			source $VIMRUNTIME/mswin.vim
			source $VIMRUNTIME/menu.vim
			source $VIMRUNTIME/delmenu.vim
		endif
	" }
	" For terminal special setting {
		if !has('gui_running')
			set termencoding=utf-8
			nnoremap <unique> <F3> :vi ~/.vimrc<CR>
			set t_Co=256
            colo vj
		endif
	" }
" }

" Bundle management {
	" BufExplorer {
		nnoremap <unique> <leader>bf :BufExplorer<CR>
	" }
	" NERDTree {
		nnoremap <unique> <leader>nt :NERDTreeToggle<CR>
		nnoremap <unique> <leader>nf :NERDTreeFind<CR>
		let NERDTreeIgnore           = ['\.exe', '\.dll', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.obj']
		let NERDTreeKeepTreeInNewTab = 1
		let NERDTreeChDirMode        = 2
		let NERDTreeShowBookmarks    = 1
		let NERDTreeDirArrows        = 0
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	" }
	" tagbar {
        let g:tagbar_iconchars = ['+', '-']
		nnoremap <unique> <leader>tb :TagbarToggle<CR>
		" when write autosave ctags
		autocmd FileType c,cpp,java,php,javascript,python
				\ autocmd BufWritePre <buffer> :call s:autogentags()
		function! s:autogentags()
			if &tags != ''
				call xolox#shell#execute("ctags -R", 0)
			endif
		endfunction
	" }
	" snipmate {
		let g:snips_author = 'icebreak'
		let g:snips_email  = 'icebreak@yeah.net'
	" }
	" piv {
		let g:DisableAutoPHPFolding = 0
		let php_folding             = 0
		let g:PIVAutoClose          = 0
		" Default values
		let g:pdv_cfg_Type          = "mixed"
		let g:pdv_cfg_Package       = "Framework"
		let g:pdv_cfg_Package       = "Webdav"
		let g:pdv_cfg_Version       = "0.1"
		let g:pdv_cfg_Author        = "icebreak"
		let g:pdv_cfg_Copyright     = "Copyright (c) 2012 All rights reserved."
		let g:pdv_cfg_License       = "PHP Version 3.0 {@link http://www.php.net/license/3_0.txt}"
	" }
	" ctrlp {
		let g:ctrlp_custom_ignore = {
			\ 'dir':  '\.git$\|\.hg$\|\.svn$',
			\ 'file': '\.exe$\|\.so$\|\.dll$' }
		let g:ctrlp_working_path_mode = '0'
	" }
	" neocomplcache {
		" Disable AutoComplPop.
		let g:acp_enableAtStartup                        = 0
		" Use neocomplcache.
		let g:neocomplcache_enable_at_startup            = 1
		" Use smartcase.
		let g:neocomplcache_enable_smart_case            = 1
		" Use camel case completion.
		let g:neocomplcache_enable_camel_case_completion = 1
		" Use underbar completion.
		let g:neocomplcache_enable_underbar_completion   = 1
		" Set minimum syntax keyword length.
		let g:neocomplcache_min_syntax_length            = 3
		let g:neocomplcache_lock_buffer_name_pattern     = '\*ku\*'
		" AutoComplPop like behavior.
		let g:neocomplcache_enable_auto_select           = 1

		" Define dictionary.
		let g:neocomplcache_dictionary_filetype_lists    = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

		" Define keyword.
		if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns             = {}
		endif
		let g:neocomplcache_keyword_patterns['default']  = '\h\w*'

		" SuperTab like snippets behavior.
		"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

		inoremap <expr><unique> <CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
		"inoremap <expr><SPACE> pumvisible() ? neocomplcache#cancel_popup() : "\<SPACE>"
		inoremap <expr><unique> <BS> neocomplcache#cancel_popup()."\<C-h>"
		"inoremap <expr><ESC> pumvisible() ? neocomplcache#cancel_popup() : "\<ESC>"
		inoremap <expr><unique> <C-]> pumvisible() ? neocomplcache#cancel_popup() : "\<ESC>"

		" Enable omni completion.
		autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
		autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
		autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
		autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
		autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

		" Enable heavy omni completion.
		if !exists('g:neocomplcache_omni_patterns')
			let g:neocomplcache_omni_patterns = {}
		endif
		let g:neocomplcache_omni_patterns.ruby   = '[^. *\t]\.\w*\|\h\w*::'
		"autocmd FileType ruby setlocal omnifunc = rubycomplete#Complete
		let g:neocomplcache_omni_patterns.php    = '[^. \t]->\h\w*\|\h\w*::'
		let g:neocomplcache_omni_patterns.c      = '\%(\.\|->\)\h\w*'
		let g:neocomplcache_omni_patterns.cpp    = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
	" }
	" jQuery syntax {
		au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
	" }
	" rooter {
		autocmd BufEnter *.php :Rooter
		let g:rooter_patterns = ['Rakefile', '.git/', 'tags', '.svn/']
	" }
" }

