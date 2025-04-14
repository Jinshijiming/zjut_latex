
% latex 版本
\NeedsTeXFormat{LaTeX2e}

% 本文件提供的cls的名字，版本
\ProvidesClass{zjutthesis}[2023/06/25 version 0.1]
% debug ---------------------------------------
% 仅编译，不生成PDF，用于debug
% \usepackage{syntonly}
% \syntaxonly

% ctexart 是 article 和 ctex 的结合，也即支持中文的文章
% ctexbook 是 book 和 ctex 的结合，也即支持中文的书籍
\LoadClass[
oneside,   % 单面排版
a4paper,   % A4纸
titlepage, % 指定标题命令 \maketitle 生成单独的标题页
UTF8,      % UTF-8编码
linespread=1.25, % 行距1.25倍=基础行距*1.25=(字号大小*1.2)*1.25
zihao=-4,  % 默认字号为小4 
]{ctexbook}
\RequirePackage{setspace}
% 确定正文字体和行距后，行间留白的距离，需要除以2
\newdimen\baselinegap
\baselinegap=\baselineskip \advance\baselinegap by -\fontdimen6\font \divide\baselinegap by 2



% 页面 需要在ctexbook后面 ---------------------------------------
% 设置页面边距 (封面单独设置)
\RequirePackage[a4paper, top=3.0cm,bottom=3.0cm,left=3.0cm,right=3.0cm]{geometry}

% 字号字体 ---------------------------------------
% 字号 \zihao{num}
% 0   初号  \zihao{0}
% −0  小初
% 1   一号
% −1  小一
% 2   二号
% −2  小二
% 3   三号
% −3  小三
% 4   四号
% −4  小四
% 5   五号
% -5  小五  \zihao{-5}


% \RequirePackage{cleveref}% 载入自动引用宏包
% \crefname{figure}{图}{图}
% \crefname{table}{表}{表}
% \crefname{equation}{式}{式}
% \renewcommand{\eqref}[1]{\labelcref{#1}~\namecref{#1}}

% 设置字体  会影响到所有的内容
% texdoc xeCJK
% SimSun KaiTi 通过查找系统字体得到  
% overleaf编译不通过
% AutoFakeBold 当没有声明对应的粗体时，是否使用伪粗体
% \setCJKmainfont[AutoFakeBold=true]{SimSun}  % overleaf 下错误
% \setCJKmainfont[AutoFakeBold=true]{fonts/simsun.ttc}

\RequirePackage{fontspec}

% 西文字体设置---------------
\setmainfont[NFSSFamily=entextrm]{XITS}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Ligatures=TeX,
]
\setsansfont[NFSSFamily=entextsf]{XITS}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Ligatures=TeX,
]
\setmonofont[NFSSFamily=entexttt]{XITS}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Ligatures=TeX,
]


% 中文字体设置----------------------
% 简体和繁体同时支持需要自己装字体如：Noto Serif CJK SC
% 判断当前所处的操作系统
\RequirePackage{ifplatform}

% windows
\ifwindows   
    \setCJKmainfont{SimSun}[AutoFakeBold=2.5,ItalicFont=KaiTi]%
    \setCJKsansfont{SimHei}[AutoFakeBold=2.5]%
    \setCJKmonofont{FangSong}%
    \newCJKfontfamily[myzhkai]\kaiti{KaiTi}[AutoFakeBold=2.5,AutoFakeSlant] %改用\kaiti命令
\fi

% linux
\iflinux
    \newCJKfontfamily[zhkai]\kaiti{FandolKai-Regular}[AutoFakeBold=2.5,AutoFakeSlant,Extension=.otf] %改用\kaiti命令
\fi

% macosx
\ifmacosx
    
    \setCJKmainfont{mySongti SC}[%
        UprightFont    = * Light,
        BoldFont       = * Bold,
        ItalicFont     = Kaiti SC,
        BoldItalicFont = Kaiti SC Bold,
    ]
    \setCJKsansfont{myHeiti SC}[BoldFont = * Medium]%
    \setCJKmonofont{mySTFangsong}%
\fi  

% ctex 已经定义的字体
% 除了在 ubuntu 字库中没有
% \fangsong 的定义外，所有字库都有以下四个字体命令。
% \songti 宋体，CJK 等价命令 \CJKfamily{zhsong}。
% \heiti 黑体，CJK 等价命令 \CJKfamily{zhhei}。
% \fangsong 仿宋，CJK 等价命令 \CJKfamily{zhfs}。
% \kaishu 楷书，CJK 等价命令 \CJKfamily
% 用法：\宋体{...}



% 章节间距、编号-----------------
\ctexset {
    chapter = {
        % 3号，黑体，居中
        format = \zihao{3}\heiti\centering, 
        % 设置章节的名字
        name = {第,章}, 
        % 中文数字序号
        number = \chinese{chapter},
        % 图目录, 章之间的图标题的距离
        lofskip = {0pt},
        % 表目录, 章之间的表标题的距离
        lotskip = {0pt},
        fixskip=true,% 用来抑制标题与正文和页眉的多余间距 默认不开启
        % 设置章节标题前的垂直间距
        beforeskip = {16pt},
        % 控制章节标题与后面下方之间的距离
        afterskip = {48pt},
    },
    section = {
        % 小3号，黑体，居左
        format = \zihao{4}\heiti\raggedright, 
        beforeskip = {24pt},
        % 控制章节标题与后面下方之间的距离
        afterskip = {12pt},
    },
    subsection = {
        % 4号，黑体，居左
        format = \zihao{-4}\heiti\raggedright, 
    },
    subsubsection = {
        % 小4号，黑体，居左
        format = \zihao{-4}\heiti\raggedright,  
    },
}


% 目录设置------------------------------------------------
% book文档类里默认为2, subsection编号，而subsubsection不编号
% 设置为3, 则subsubsection编号
\setcounter{secnumdepth}{3} 
% 目录的深度, subsection
\setcounter{tocdepth}{2}

% 这个导引点加了以后，目录，图目录，表目录就不居中
% 目录相关------
% 确保章与页码之间也有引导点
% \usepackage{subfigure}
% \usepackage[subfigure]{tocloft}
% \renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

%---------------------------------------------------------------------------%
%->> Configure table of contents
%---------------------------------------------------------------------------%
%- the table of contents is specified by defining \l@chapter, \l@section, ...
%- most commands are then defined with the \@dottedtocline:
%- \@dottedtocline{⟨level⟩}{⟨indent⟩}{⟨numwidth⟩}{⟨title⟩}{⟨page⟩}
%- ⟨level⟩    an entry is produced only if ⟨level⟩ <= value of the tocdepth counter
%-            note, \chapter is level 0, \section is level 1, etc
%- ⟨indent⟩   indentation from the outer left margin of the start of the contents line
%- ⟨numwidth⟩ width of a box in which the section number is to go
%- <title>    title
%- <page>     page number

%- 目录设置
\def\@dotsep{1.5mu}% separation between dots in mu units
\def\@pnumwidth{2em}% width of a box in which the page number is put
\def\@tocrmarg{2em}% right margin for multiple line entries, \@tocrmarg ≥ \@pnumwidth
\def\@chaptervspace{1ex}% 目录中章节标题的垂直距离

%- redefine dottedtocline from classes.dtx and latex.ltx
\renewcommand*{\@dottedtocline}[5]{% [<level>,<indent>,<numwidth>,<title>,<page>]
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M
        \leavevmode \zihao{-4}
        \@tempdima #3\relax
        \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
        {#4}\nobreak
        \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
        \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
        \par\penalty\@highpenalty}%
    \fi
}
%- redefine l@part from book.cls to add dotted toc line
\renewcommand*{\l@part}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >-2\relax
        \addpenalty{-\@highpenalty}%
        \addvspace{2.25em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            {\leavevmode
            \zihao{-4} #1
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
            \nobreak
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \endgroup
    \fi
}
%- 重定义目录章节部分，加入了引导符dotted toc line
\renewcommand*{\l@chapter}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip \@chaptervspace \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \zihao{-4} \heiti
            \advance\leftskip\@tempdima
            \hskip -\leftskip 
            #1\nobreak
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi
}
%- 重定义目录缩进
\renewcommand*\l@section{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2.8em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3em}{3.8em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{4em}{4.8em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{5em}{5.8em}}
\renewcommand*\l@figure{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@table{\@dottedtocline{1}{1em}{1.8em}} 



% 浮动体相关---------------------------------------
% textfraction页面中必须用来排放文本的最小比例。缺省值为 0.2， 即一页中浮动对象所占的比例不得超过 80%。
\renewcommand{\textfraction}{0.15} 
% topfraction页面顶部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.7，即放置在页顶部的浮动对象所占 的高度不得超过整个页面高度 70%。同样地，如果多个 使用了选项 t 的浮动对象的高度和超过了 整个页面高度的 60%，即使它们的数目没有超过  topnumber 的值，仍将一个也不会被放置 在页面顶部。
\renewcommand{\topfraction}{0.85} 
% bottomfraction页面底部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.3，这使得如果浮动对象的高度 不超过整个页面高度的 40%，可以允许放置在页面底部。
\renewcommand{\bottomfraction}{0.65} 
% 浮动页中必须由浮动对象占用的最小比例。因此 在一浮动页中空白所占的比例不会超过 1 - \floatpagefraction。缺省值为 0.5。
\renewcommand{\floatpagefraction}{0.60}
\setlength{\floatsep}{6pt plus 2pt minus 1pt} % 相邻两个浮动体之间的垂直距离。
\setlength{\textfloatsep}{10pt plus 3pt minus 2pt} % 页面中最后一个 t 模式的浮动体与文本的间距；页面中第一个 b 模式的浮动体与文本的间距。
\setlength{\intextsep}{8pt plus 2pt minus 2pt} % 页面中共 h 模式的浮动体上下与文本的间距
% \setlength{\@fptop}{6bp plus2bp} 浮动页顶部与第一个浮动体之间的垂直距离
% \setlength{\@fpsep}{12bp plus2bp} 浮动体之间的垂直间距
% \setlength{\@fpbot}{6bp plus2bp} 最后一个浮动体与浮动页底部之间的垂直距离



% 图，表，公式 ---------------------------------------
% 用于加载图片 includegraphics
\RequirePackage{graphicx}

% 设置图片路径，加载图片可以忽略img前缀
\graphicspath{{img/}}

% 抑制图片表格等的浮动 
% \begin{figure}[H] [H]表示把图片放于当前位置
\RequirePackage{float}
% 禁止浮动体跨节
\RequirePackage[section]{placeins}

% 表格宏包
\RequirePackage{booktabs,tabularx,multirow,longtable,makecell}
\RequirePackage{array}

% 设置公式编号样式
\makeatletter
\@addtoreset{equation}{chapter}
\makeatother
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}

% 设置图，表的 caption的属性
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption} %list=off取消bi-second添加到目录里

% 重新定义图的标题序号格式 (章号-图号)
% {chapter}是章的计数器
% {figure}是图的计数器
% 图的标题由 \caption 命令生成
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}

% \renewcommand\tablename{}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}

% 设置题注与图标的间距
\captionsetup{skip=\baselinegap}
% 设置浮动体标题悬挂缩进
\captionsetup{format=hang}
% 宋体，5号
% 原始的word模板中图表标题的字号只有小五，似乎太小了点
% 把它改成5号
\DeclareCaptionFont{songti}{\songti}
\DeclareCaptionFont{zihao5}{\zihao{5}} 
\captionsetup{font={songti, zihao5,bf}}
% labelsep 设置编号和标题之间的符号，默认是冒号colon
\DeclareCaptionLabelSeparator{dspace}{\space\space}
\captionsetup{labelsep=dspace}

%双题注的设置
\DeclareBiCaptionSeparator{vspace}{\vspace{\baselinegap}}%设置双题注的垂直间隔
\captionsetup{bi-separator=vspace}


\captionsetup[figure][bi-second]{name=Figure} %设置图的英文编号前缀
\captionsetup[table][bi-second]{name=Table} %设置表的英文编号前缀





% 列表相关 ---------------------------------------
\RequirePackage{enumitem}
\RequirePackage{circledsteps} % 用来支持①这种数字 命令\Circled
% 每一个item第一行缩进
% \parindent 是首行缩进
\setlist[enumerate]{wide=\parindent}
\setlist[itemize]{wide=\parindent} 
% 列表编号格式（1）- 1）-
\setlist[enumerate,1]{label=(\arabic*)}
\setlist[enumerate,2]{label=\arabic*)}
\setlist[enumerate,3]{label=\Circled{\arabic*}}
% 列表项之间无多余间距，列表和正文之间无多余间距
\setlist{nosep}



% 下划线 颜色 相关 ---------------------------------------
% ulem宏包
% 可断行下划线命令\uline
\RequirePackage{ulem}

% 颜色宏包
\RequirePackage{color,xcolor}

% 参考文献相关 ---------------------------------------
% 载入参考文献宏包，设置引用格式
% natbib宏包配合gbt7714-numerical.bst使用
% number是参考文献显示数字标号
% sort&compress 是排序，以及[2-7]这种形式
% \RequirePackage[numbers, sort&compress]{natbib}

% gbt7714 格式 包含natbib，二者只要一个
% 这个宏包有两种用法，1是宏包，2是bst
% 没有直接使用这个宏包，而是直接使用gbt7714-numerical.bst，是为了定制“出版地不详“，参考 texdoc gbt7714
\RequirePackage[sort&compress]{gbt7714}
% \citestyle{numbers}
% 上角标
\citestyle{super}
% 参考文献页的行距
\setlength{\bibsep}{0.5ex} 

% 源代码相关 ---------------------------------------
\RequirePackage{zjutcode}

% 数学公式相关 ---------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{newtxmath}
\RequirePackage{esint}

% 页眉页脚相关 ---------------------------------------
% texdoc fancyhdr
\usepackage{fancyhdr}

\RequirePackage{ifthen}
\newcommand{\myfancy}{
    % 先清空样式
    \fancyhf{}
    % 页脚，居中，页码
    %\fancyhead[CE]{\zihao{5}\songti{\fillType}}
    %\fancyhead[CO]{\zihao{5}\songti{\deftitle}}

    \fancyhead[C]{\ifthenelse{\isodd{\value{page}}}{\zihao{5}\songti{\defTitleCn}}{\zihao{5}\songti{\fillType}}}
    
    \fancyfoot[C]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0.75pt}
    % \renewcommand{\headheight}{13pt}
    \setlength{\headwidth}{\textwidth}% 页眉宽度=正文宽度
    \setlength{\headheight}{13pt}% 页眉高度
}

% 自定义页眉页脚样式
\fancypagestyle{myfancy}{
    \myfancy
}
% 使用自定义样式
\pagestyle{myfancy}

% book文档类的每章第一页为plain格式
% 默认的plain格式，每章第一页不显示页眉
% 重新定义plain样式，在每章第一页使用自定义样式\myfancy
\fancypagestyle{plain}{
    \myfancy
}




%%%%%%%% ---------文档信息------------ %%%%%%%%
\RequirePackage{xstring}      % 正文标题中替换换行
\RequirePackage{datetime}     % 日期

% 中文题目
\def\defTitleCn{}
\newcommand{\mytitle}[1]{\def\defTitleCn{#1}}
% 英文题目
\def\defTitleEn{}
\newcommand{\myTITLE}[1]{\def\defTitleEn{#1}}

%指导老师
%导师姓名
\def\defSupervisor{}
\newcommand{\supervisor}[1]{\def\defSupervisor{#1}}
%导师职称
\def\defSupervisorTitle{}
\newcommand{\supervisorTitle}[1]{\def\defSupervisorTitle{#1}}
%导师姓名(英)
\def\defSupervisorEn{}
\newcommand{\supervisorEn}[1]{\def\defSupervisorEn{#1}}
%导师职称(英)
\def\defSupervisorTitleEn{}
\newcommand{\supervisorTitleEn}[1]{\def\defSupervisorTitleEn{#1}}
%第二导师
%导师姓名
\def\defSecondSupervisor{}
\newcommand{\Secondsupervisor}[1]{\def\defSecondSupervisor{#1}}
%导师职称
\def\defSecondSupervisorTitle{}
\newcommand{\SecondsupervisorTitle}[1]{\def\defSecondSupervisorTitle{#1}}
%导师姓名(英)
\def\defSecondSupervisorEn{}
\newcommand{\SecondsupervisorEn}[1]{\def\defSecondSupervisorEn{#1}}
%导师职称(英)
\def\defSecondSupervisorTitleEn{}
\newcommand{\SecondsupervisorTitleEn}[1]{\def\defSecondSupervisorTitleEn{#1}}


%普通的 \newcommand 定义的命令在某些环境（比如 \section{}、\caption{} 或 PDF 书签）中可能失效或报错。
\DeclareRobustCommand{\fillType}{浙江工业大学硕士学位论文}
\DeclareRobustCommand{\zjutType}[1]{\renewcommand{\fillType}{#1}}


\def\defFillAuthorCn{}
\newcommand{\fillAuthorCn}[1]{\def\fillAuthorCn{#1}}

\def\defFillAuthorEn{}
\newcommand{\fillAuthorEn}[1]{\def\fillAuthorEn{#1}}

\def\defFillMajor{}
\newcommand{\fillMajor}[1]{\def\fillMajor{#1}}

\def\defFillAcademic{}
\newcommand{\fillAcademic}[1]{\def\fillAcademic{#1}}

\def\defFillCultiviate{}
\newcommand{\fillCultiviate}[1]{\def\fillCultiviate{#1}}

\def\defFillCollege{}
\newcommand{\fillCollege}[1]{\def\fillCollege{#1}}

\def\defFillresearchArea{}
\newcommand{\fillresearchArea}[1]{\def\fillresearchArea{#1}}

\def\defFillchairman{}
\newcommand{\fillchairman}[1]{\def\fillchairman{#1}}

\def\defFillYear{}
\newcommand{\fillYear}[1]{\def\fillYear{#1}}

\def\defFillMonth{}
\newcommand{\fillMonth}[1]{\def\fillMonth{#1}}

\def\defFillDay{}
\newcommand{\fillDay}[1]{\def\fillDay{#1}}

% \def\defvalueschool{浙江工业大学计算机科学与技术学院}

\def\deffrontpage{封面}
\def\defdeclarationpage{声明}
% 重新定义图目录的标题
\renewcommand\listfigurename{插图清单}
% 重新定义表目录的标题
\renewcommand\listtablename{附表清单}
\def\defabstractname{摘要}
\def\defABSTRACTNAME{ABSTRACT}
\def\defkeywords{关键词：}
\def\defKEYWORDS{Key Words: }
\def\defacknowledgement{致谢}



% 摘要相关---------------------------------- 

% 中文摘要
\newcommand{\abstract}[1]{%
    % \noindent {\bfseries {[\defabstractname]}} #1}
    % 垂直空间
    \vspace*{2ex}
    % 摘要
    \begin{center}
        {\zihao{3}\heiti \defabstractname}
    \end{center}
    % 垂直空间
    \vspace*{2ex}
    
    % 摘要实际内容
    #1}
% 英文摘要
\newcommand{\ABSTRACT}[1]{%
    %\noindent {\bfseries {[\defABSTRACTNAME]}} #1}
    % 垂直空间
    \vspace*{2ex}
    % Abstract
    \begin{center}
        {\zihao{3}\heiti \defABSTRACTNAME}
    \end{center}
    % 垂直空间
    \vspace*{2ex}
    
    % 摘要实际内容
    #1}

% 中文关键词
\newcommand{\keywords}[1]{%
    %\vspace{\baselineskip}
    \vspace{1ex}
    \noindent { \bfseries {\defkeywords} } #1}
% 英文关键词
\newcommand{\KEYWORDS}[1]{%
    %\vspace{\baselineskip}
    \vspace{1ex}
    \noindent {\bfseries {\defKEYWORDS}} #1}



% 例子相关 ---------------------------------------------
%\RequirePackage{style/zscexample}



% 超链接相关 -------------------------------------------
% 为减少可能的冲突，习惯上将 hyperref 宏包放在其它宏包之后调用
% 对于章节命令 \chapter、 \section等，默认情况下会为 PDF 自动生成书签
% bookmarks=⟨true|false⟩ 默认生成书签
% hidelinks=true 取消链接的颜色和边框
% bookmarksnumbered=true 书签带章节号
\usepackage[hidelinks,bookmarksnumbered=true]{hyperref}