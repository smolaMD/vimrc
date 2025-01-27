"----------------------
" Отображение
"----------------------

syntax on

set termguicolors                                 " Поддержка 24-битных цветов
colorscheme dogrun
set background=dark

set number
set relativenumber                                 " Относительная нумерация
set numberwidth=1                                  " Ширина номера строки

highlight LineNr ctermfg=NONE guifg=NONE           " Отключение цвета для номеров строк
highlight CursorLineNr ctermfg=NONE guifg=NONE     " Отключение цвета для текущего номера строки

set scrolloff=5                                    " Отступ от края экрана при прокрутке
set mouse=a

"set colorcolumn=110                               " Выделение столбца
"highlight ColorColumn ctermbg=darkblue            " Цвет столбца

set wildmode=longest:list,full                     " bach-подобное дополнение командной строки

"----------------------



"----------------------
" Табуляция
"----------------------

set expandtab                                      " Замена табуляции на пробелы
set tabstop=4                                      " Колличество пробелов при табуляции
set shiftwidth=4                                   " Колличество пробелов при автодобавлении отступов
set softtabstop=4                                  " Колличество пробелов при автотабуляции

set smarttab                                       " Умное поведение табуляции
set smartindent                                    " Умное выравнивание для кода
set autoindent                                     " Сохранение отступа прошлой строки в новой

autocmd filetype c,cpp set cin                     " Отступы в стиле C

autocmd filetype make set noexpandtab              " Табуляция без замены на пробелы в Make-файлах                      
autocmd filetype make set nocin

autocmd filetype python set nocin                  " Табуляция без замены на пробелы в Python-файлах

"----------------------



"----------------------
" Язык и кодировка
" ---------------------

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" Поддержка русской раскладки для команд

set encoding=utf-8                                 " Устанавливаем кодировку UTF-8
set fileencodings=utf-8                            " Поддержка кодировки UTF-8 для файлов

"----------------------



"----------------------
" Безопасность
"----------------------

set exrc                                           " Включение чтения .vimcr в текущей директории
set secure                                         " Запрет опасных команд в локальных .vimcr файлах

set modelines=0

"----------------------



"----------------------
" Поиск
"----------------------

set hlsearch                                       " Включаем подсветку поиска
set incsearch                                      " Поиск по мере ввода
set ic                                             " Игнорировать регистр при поиске
set smartcase                                      " Игнорировать регистр, если нет заглавных букв

"----------------------



"======================
" Плагины
"======================

set nocompatible                                   " Отключение совместимости с vi
filetype off

set rtp+=~/.vim/bundle/Vundle.vim                  " Путь для включения Vundle

"----------------------

call vundle#begin()

Plugin 'gmarik/Vundle.vim'                         " Vundle
Plugin 'scrooloose/nerdtree'                       " NERD Tree (файловый браузер)
Plugin 'Rip-Rip/clang_complete'                    " Clang complete (анализ кода)
Plugin 'SirVer/ultisnips'                          " UltiSnip (сниппеты)
Plugin 'honza/vim-snippets'
Plugin 'wadackel/vim-dogrun'                       " Dgqrun (тема)

call vundle#end()

"----------------------

filetype plugin indent on                          " Включение поддержки плагинов



"----Clang-completer----

let g:clang_snippets=1                             " Дополнительные подсказки
let g:clang_snippets_engine = 'ultisnips'          " Использование ultisnips для дополнительных подскахок
let g:clang_close_preview=1                        " Автоматическое закрытие окна подсказок после выбора подсказки

let g:clang_periodic_quickfix=1                    " Периодическая проверка проекта на ошибки
let g:clang_hl_errors=1                            " Подсветка ошибок

map <c-f> :call g:ClangUpdateQuickFix()<cr>        " Проверка проекта на ошибки



"----NERDTree----

map <c-n> :NERDTreeToggle<cr>                      " Открытие дерева

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set splitright                                     " Открытие новых окон справа



"----Snippets----

let g:UltiSnipsExpandTrigger="<c-a>"               " Раскрытие шаблона

let g:UltiSnipsListSnippets="<c-d>"                " Отображение списка шаблонов

let g:UltiSnipsJumpForwardTrigger="<c-b>"          " Вперёд по шаблонам

let g:UltiSnipsJumpBackwardTrigger="<c-z>"         " Назад по шаблонам

let g:UltiSnipsEditSplit="vertical"                " Разделение окна вертикально при редактировании
 
let g:UltiSnipsUsePythonVersion=3                  " Версия Python 
