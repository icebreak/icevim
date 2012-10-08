" vim: set foldmarker={,} foldlevel=0 foldmethod=marker nospell:

" Basic Setting {
	let mapleader = ','
	syntax on
	set nocompatible
    set laststatus=2
    filetype plugin on
" }

" Bundle management {
    " Vundle support{
        if has("gui_running")
		    set rtp+=$VIM/bundle/vundle
		    call vundle#rc("$VIM/bundle")
        else
		    set rtp+=~/bundle/vundle
		    call vundle#rc("~/bundle")
        endif
		"Vundle is short for Vimbundle and is a Vim plugin manager.
		Bundle 'gmarik/vundle'
	" }
	" fugitive {
	    Bundle 'tpope/vim-fugitive'
	" }
	" vim-colorschemes {
		"one stop shop for vim colorschemes.
		"this is harvested from vim.org. only colorschemes downloaded in a single .vim file are included.
		"for hacking on vim.org harvesting see the branch prep.
		Bundle 'flazz/vim-colorschemes'
	" }
	" BufExplorer {
		"With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces:
		"'\be' (normal open)  or
		"'\bs' (force horizontal split open)  or
		"'\bv' (force vertical split open)
		Bundle 'corntrace/bufexplorer'
		" setting {
			nmap <leader>bf :BufExplorer<CR>
		" }
	" }
	" vim-statline {
		"Add useful informations to the statusline
		Bundle 'Lokaltog/vim-powerline'
	" }
	" matchit {
		"The matchit.vim script allows you to configure % to match more than just single characters.
		Bundle 'matchit.zip'
	" }
	" vim-surround {
		"Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
		Bundle 'tpope/vim-surround'
	" }
	" NERDTree {
		"The NERD tree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.
		Bundle 'scrooloose/nerdtree'
		" setting {
			nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
			map <leader>nf :NERDTreeFind<CR>
			let NERDTreeIgnore=['\.exe', '\.dll', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
			let NERDTreeKeepTreeInNewTab=1
			let NERDTreeChDirMode=2
			let NERDTreeShowBookmarks=1
		" }
	" }
	" tagbar {
		"Tagbar is a vim plugin for browsing the tags of source code files. It provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. This means that for example methods in C++ are displayed under the class they are defined in.
		Bundle 'majutsushi/tagbar'
		" setting {
			nnoremap <silent> <leader>tb :TagbarToggle<CR>
		" }
	" }
	" snipmate {
		"Plugin for using TextMate-style snippets in Vim.
		Bundle 'msanders/snipmate.vim'
		" setting {
			let g:snips_author = 'icebreak'
			let g:snips_email = 'icebreak@yeah.net'
		" }
	" }
	" piv {
		"This project contains the most feature complete and up to date PHP Integration for Vim.
        Bundle 'spf13/PIV'
		" Setting {
			let g:DisableAutoPHPFolding = 0
            let php_folding = 0
			let g:PIVAutoClose          = 0
			" Default values
			let g:pdv_cfg_Type          = "mixed"
			let g:pdv_cfg_Package     = "Framework"
			let g:pdv_cfg_Package       = "Webdav"
			let g:pdv_cfg_Version       = "0.1"
			let g:pdv_cfg_Author        = "icebreak"
			let g:pdv_cfg_Copyright     = "Copyright (c) 2012 All rights reserved."
			let g:pdv_cfg_License       = "PHP Version 3.0 {@link http://www.php.net/license/3_0.txt}"
		" }
	" }
	" ctrlp {
		"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
		Bundle 'kien/ctrlp.vim'
		" setting {
			let g:ctrlp_custom_ignore = {
				\ 'dir':  '\.git$\|\.hg$\|\.svn$',
				\ 'file': '\.exe$\|\.so$\|\.dll$' }
			let g:ctrlp_working_path_mode = '0'
            "let g:ctrlp_match_window_reversed = 0
		" }
	" }
	" neocomplcache {
		"Neocomplcache performs keyword completion by making a cache of keywords in a buffer. I implemented it because unlike the Vim builtin keyword completion, neocomplcache can be customized flexibly. Unfortunately, neocomplcache may use more memory than other plugins.
		Bundle 'Shougo/neocomplcache'
		" setting {
			" Disable AutoComplPop.
			let g:acp_enableAtStartup = 0
			" Use neocomplcache.
			let g:neocomplcache_enable_at_startup = 1
			" Use smartcase.
			let g:neocomplcache_enable_smart_case = 1
			" Use camel case completion.
			let g:neocomplcache_enable_camel_case_completion = 1
			" Use underbar completion.
			let g:neocomplcache_enable_underbar_completion = 1
			" Set minimum syntax keyword length.
			let g:neocomplcache_min_syntax_length = 3
			let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
			" AutoComplPop like behavior.
			let g:neocomplcache_enable_auto_select = 1

			" Define dictionary.
			let g:neocomplcache_dictionary_filetype_lists = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }

			" Define keyword.
			if !exists('g:neocomplcache_keyword_patterns')
				let g:neocomplcache_keyword_patterns = {}
			endif
			let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


			" SuperTab like snippets behavior.
			"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"



			inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
			"inoremap <expr><SPACE> pumvisible() ? neocomplcache#cancel_popup() : "\<SPACE>"
			inoremap <expr><BS> neocomplcache#cancel_popup()."\<C-h>"
			"inoremap <expr><ESC> pumvisible() ? neocomplcache#cancel_popup() : "\<ESC>"
			inoremap <expr><C-]> pumvisible() ? neocomplcache#cancel_popup() : "\<ESC>"



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
			let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
			"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
			let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
			let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
			let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
		" }
	" }
	" jQuery syntax {
		"It currently detects syntax and keywords for jQuery 1.6.
		Bundle 'nono/jquery.vim'
		" setting {
			au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
		" }
	" }
	" zenCoding {
		"zencoding-vim is vim script support for expanding abbreviation like zen-coding.
		Bundle 'mattn/zencoding-vim'

	" }
	" vimwiki {
	    Bundle 'vimwiki'
        " setting {
            let g:vimwiki_list = [{'path': $VIM . '/wiki/', 'path_html': $VIM . '/wiki/html/'}]
        " }
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
		set expandtab                   " tabs are spaces, not tabs
		set tabstop=4                   " an indentation every four columns
		set softtabstop=4               " let backspace delete indent
		set history=1000                " Store a ton of history (default is 20)
		set hidden                      " allow buffer switching without saving
		set mouse=a
		let html_no_rendering=1
		set noswapfile
		" use space to toggle fold
		nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
		" Remove trailing whitespaces and chars
		autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,vim
			\ autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
		autocmd! bufwritepost .vimrc source $MYVIMRC " auto read setting when change .vimrc
	" }
	" Common keymap {
		imap <leader>e <ESC>
		imap zz <ESC>
		map <leader>c <C-]>
		map <leader>ts :ts<CR>
        map <c-u> :update<CR>

		" Easier moving in tabs and windows
		map <C-j> <C-W>j
		map <C-k> <C-W>k
		map <C-l> <C-W>l
		map <C-h> <C-W>h

		" Wrapped lines goes down/up to next row, rather than next line in file.
		nnoremap j gj
		nnoremap k gk

		" Yank from the cursor to the end of the line, to be consistent with C and D.
		nnoremap Y y$

		" Shortcuts
		" Change Working Directory to that of the current file
		cmap cwd lcd %:p:h
		cmap cd. lcd %:p:h
	" }
	" For gui special setting {
		if has('gui_running')
			language messages en_US
			set guifont=Courier_New:h12:cANSI
			set guioptions-=T "hide toolbar
			set guioptions-=m "hide menubar
			colo vj
			map <F3> :vi $VIM/.vimrc<CR>
			source $VIMRUNTIME/mswin.vim
			source $VIMRUNTIME/menu.vim
			source $VIMRUNTIME/delmenu.vim
		endif
	" }
	" For terminal special setting {
		if !has('gui_running')
			set termencoding=utf-8
			map <F3> :vi ~/.vimrc<CR>
            colo devbox-dark-256
            colo oceanblack256
		endif
	" }
" }
