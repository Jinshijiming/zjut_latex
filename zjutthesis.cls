
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
linespread=1.3541667, % 行距1.25倍=基础行距*1.25=(字号大小*1.2)*1.25
%word 计算公式可以近似为 行距1.25倍=基础行距*1.25=(字号大小*1.3)*1.25
%所以 word行距1.25倍=latex行距1.3541667倍
zihao=-4,  % 默认字号为小4 
]{ctexbook}
\RequirePackage{setspace}

% 确定正文字体和行距后，行间留白的距离，需要除以2
\newdimen\baselinegap
\baselinegap=\baselineskip \advance\baselinegap by -\fontdimen6\font \divide\baselinegap by 2



% 页面 需要在ctexbook后面 ---------------------------------------
% 设置页面边距 (封面单独设置)
\RequirePackage[a4paper, top=2.5cm,bottom=2.5cm,left=3.0cm,right=3.0cm,headsep=10pt,footskip=0.75cm]{geometry}

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



% 设置字体  会影响到所有的内容
% texdoc xeCJK
% SimSun KaiTi 通过查找系统字体得到  
% overleaf编译不通过
% AutoFakeBold 当没有声明对应的粗体时，是否使用伪粗体
% \setCJKmainfont[AutoFakeBold=true]{SimSun}  % overleaf 下错误
% \setCJKmainfont[AutoFakeBold=true]{fonts/simsun.ttc}
% \RequirePackage{fontspec}
\RequirePackage{xdufont}
% ctex 已经定义的字体  除了在 ubuntu 字库中没有
% \fangsong 的定义外，所有字库都有以下四个字体命令。
% \songti 宋体，CJK 等价命令 \CJKfamily{zhsong}。
% \heiti 黑体，CJK 等价命令 \CJKfamily{zhhei}。
% \fangsong 仿宋，CJK 等价命令 \CJKfamily{zhfs}。
% \kaishu 楷书，CJK 等价命令 \CJKfamily

\xdusetup{
    style={
        cjk-font        = win, %simsun.ttc、 simkai.ttf、 simhei.ttf 和 simfang.ttf
        cjk-fake-bold   = 2, % 伪粗体粗细程度,默认为 3
        cjk-fake-slant  = 0.2, %中文字体伪斜体倾斜程度。默认为 0.2
        latin-font      = tacn , %gyre默认|tacn  设置英文字体 times.ttf、 timesbd.ttf、 timesi.ttf、 timesbi.ttf、 arial.ttf、 arialbd.ttf、 ariali.ttf、 arialbi.ttf、 cour.ttf、 courbd.ttf、 couri.ttf 和 courbi.ttf
        math-font       = termes, %termes
        font-type       = file, % font使用系统字体|file使用指定路径
        font-path       = fonts %字体目录
    }
}




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
        beforeskip = {24pt},
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
        % 设置章节标题前的垂直间距
        beforeskip = {\baselinegap},
        % 控制章节标题与后面下方之间的距离
        afterskip = {0pt},
    },
    subsubsection = {
        % 小4号，黑体，居左
        format = \zihao{-4}\heiti\raggedright,  
    },
    appendix={
        name={},
        number ={},
        numbering= true,
    },
}


% 目录设置------------------------------------------------
% book文档类里默认为2, subsection编号，而subsubsection不编号
% 设置为3, 则subsubsection编号
\setcounter{secnumdepth}{3} 
% % 目录的深度, subsection
% \setcounter{tocdepth}{2}
\RequirePackage{titletoc,titlesec} %不能放到前面，会影响标题设置

\titlecontents{chapter}
    [1em]{\heiti}
    {\contentspush{\thecontentslabel\space}}{}
    {\titlerule*[0.5em]{$\cdot$}\thecontentspage}
\titlecontents{section}
    [2em]{}
    {\contentspush{\thecontentslabel\space\space}}{}
    {\titlerule*[0.5em]{$\cdot$}\thecontentspage}
\titlecontents{subsection}
    [4em]{}
    {\contentspush{\thecontentslabel\space\space}}{}
    {\titlerule*[0.5em]{$\cdot$}\thecontentspage}
\titlecontents{figure}
    [1em]% 左边距
    {\contentsmargin[2ex]{1ex}}  % 右边处理                       
    {\contentspush{\figurename~\thecontentslabel\quad}}{}       % 带编号的条目格式            % 无编号的条目格式
    {\titlerule*[0.5em]{$\cdot$}\contentspage} % 页码格式
\titlecontents{table}
    [1em]% 左边距
    {\contentsmargin[2ex]{1ex}}                          
    {\contentspush{\tablename~\thecontentslabel\quad}}{}       % 带编号的条目格式
    {\titlerule*[0.5em]{$\cdot$}\contentspage} % 页码格式



%---------------------------------------
% 开始导入一些功能型的包
%---------------------------------------
\RequirePackage{etoolbox} %方便全局设置的宏包
\RequirePackage{graphicx}% 用于加载图片 includegraphics
\RequirePackage{float}
\RequirePackage[section]{placeins}% 禁止浮动体跨节

% 题注宏包
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption} %list=off取消bi-second添加到目录里

% ulem宏包
% 可断行下划线命令\uline
\RequirePackage{ulem}
\renewcommand{\uline}{\ul}
% 颜色宏包
\RequirePackage{color,xcolor}
% 表格宏包
\RequirePackage{booktabs,multirow,longtable,tcolorbox}
\RequirePackage{array}
\usepackage{adjustbox}



% textfraction页面中必须用来排放文本的最小比例。缺省值为 0.2， 即一页中浮动对象所占的比例不得超过 80%。
\renewcommand{\textfraction}{0} 
% topfraction页面顶部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.7，即放置在页顶部的浮动对象所占 的高度不得超过整个页面高度 70%。同样地，如果多个 使用了选项 t 的浮动对象的高度和超过了 整个页面高度的 60%，即使它们的数目没有超过  topnumber 的值，仍将一个也不会被放置 在页面顶部。
\renewcommand{\topfraction}{0.85} 
% bottomfraction页面底部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.3，这使得如果浮动对象的高度 不超过整个页面高度的 40%，可以允许放置在页面底部。
\renewcommand{\bottomfraction}{0.65} 
% 浮动页中必须由浮动对象占用的最小比例。因此 在一浮动页中空白所占的比例不会超过 1 - \floatpagefraction。缺省值为 0.5。
\renewcommand{\floatpagefraction}{0.60}

% 图，表，公式 ---------------------------------------
\graphicspath{{img/}}% 设置图片路径，加载图片可以忽略img前缀


% 不对表格内容环境进行全局设置，否则会影响封面页的字号设置
% \AtBeginEnvironment{tabular}{\zihao{5}}% 设置所有tabular环境使用5号字体

% 设置所有table浮动体环境使用5号字体
% \AtBeginEnvironment{table}{\zihao{5}} 必须将字号命令写在begin之后，atbegin不能实现
\let\oldtable\table  %保存原始的 \table 环境
\let\endoldtable\endtable
\renewenvironment{table}[1][]  % 重新定义 \table 环境，并保持可选参数
  {\oldtable[#1]\zihao{5}}  % 使用可选参数 [htbp] 和自定义设置
  {\endoldtable}

%-------------------------------------
%  设置浮动体编号
% {chapter}是章的计数器
% {figure}是图的计数器
% 图的标题由 \caption 命令生成
%-------------------------------------
% 设置公式编号样式
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
% 图的编号样式 (章号-图号)
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
% 表的编号样式
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}

%-------------------------------------
%  设置浮动体间距
%-------------------------------------
% 设置题注与图表的间距(aboveskip) 题注与正文的间距belowskip
\captionsetup[table]{belowskip=9pt plus 0pt minus 6pt,aboveskip=\baselinegap}
\captionsetup[figure]{belowskip=9pt plus 0pt minus 6pt,aboveskip=\baselinegap}
%用来设置图与正文的间距  但是会与题注间距叠加 故而题注基准间距从12pt->9pt
\setlength{\floatsep}{12pt plus 2pt minus 2pt} % 相邻两个浮动体之间的垂直距离。
\setlength{\textfloatsep}{6pt plus 0pt minus 3pt} % 页面中第一个 t 模式的浮动体与文本的间距；页面中第一个 b 模式的浮动体与文本的间距。
\setlength{\intextsep}{6pt plus 0pt minus 3pt} % 页面中共 h 模式的浮动体上下与文本的间距
\setlength{\@fptop}{0pt plus 2pt minus 1pt} %浮动页顶部与第一个浮动体之间的垂直距离
\setlength{\@fpsep}{0pt plus 2pt minus 1pt} %浮动体之间的垂直间距
\setlength{\@fpbot}{0pt plus 2pt minus 1pt} %最后一个浮动体与浮动页底部之间的垂直距离

%-------------------------------------
%  设置浮动体题注格式、间隔、前缀、间隔符号设置
%-------------------------------------
\DeclareCaptionFont{songti}{\songti}
\DeclareCaptionFont{zihao5}{\zihao{5}} 
\DeclareCaptionLabelSeparator{dspace}{\space\space} % labelsep 设置编号和标题之间的符号，默认是冒号colon
\DeclareBiCaptionSeparator{vspace}{\vspace{\baselinegap}}%设置双题注的垂直间隔
\captionsetup{
    font={songti, zihao5,bf},
    justification=centering, % 设置浮动体标题居中对齐
    % format=hang,% 设置浮动体标题悬挂缩进
    labelsep=dspace,
    bi-separator=vspace
    }

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

% 参考文献相关 ---------------------------------------
% 载入参考文献宏包，设置引用格式
% natbib宏包配合gbt7714-numerical.bst使用
% number是参考文献显示数字标号
% sort&compress 是排序，以及[2-7]这种形式
% \RequirePackage[numbers, sort&compress]{natbib}

% gbt7714 格式 包含natbib，二者只要一个
% 这个宏包有两种用法，1是宏包，2是bst
% 没有直接使用这个宏包，而是直接使用gbt7714-numerical.bst，是为了定制“出版地不详“，参考 texdoc gbt7714
% 即使没用这个宏包提供的bst，还是需要他进行全局控制的
\RequirePackage[sort&compress]{gbt7714} 
% \citestyle{numbers}
% 上角标
\citestyle{super}
% 两个参考文献之间的 行距增量
\setlength{\bibsep}{0ex} 

% 源代码相关 ---------------------------------------
\RequirePackage{zjutcode}

% 数学公式相关 ---------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
% \RequirePackage{newtxmath}
\RequirePackage{esint}
\RequirePackage{wasysym}

%-------------------------------------
%  设置数学公式与正文间距
%-------------------------------------
% %使用 \g@addto@macro 修改全局设置 会导致页眉线偏移
% \makeatletter
% \g@addto@macro\normalsize{%
%     \setlength\abovedisplayskip{\baselinegap}
%     \setlength\belowdisplayskip{\baselinegap}
%     \setlength\abovedisplayshortskip{\baselinegap}
%     \setlength\belowdisplayshortskip{\baselinegap}
% }
% \makeatother
\AtBeginDocument{
    \setlength\abovedisplayskip{\baselinegap}
    \setlength\belowdisplayskip{\baselinegap}
    \setlength\abovedisplayshortskip{\baselinegap}
    \setlength\belowdisplayshortskip{\baselinegap}
}
% 页眉页脚相关 ---------------------------------------
% texdoc fancyhdr
\RequirePackage{fancyhdr}

\RequirePackage{ifthen}
\newcommand{\myfancy}{
    % 先清空样式
    \fancyhf{}
    % 页脚，居中，页码
    %\fancyhead[CE]{\zihao{5}\songti{\fillType}}
    %\fancyhead[CO]{\zihao{5}\songti{\deftitle}}

    \fancyhead[C]{\ifthenelse{\isodd{\value{page}}}{\zihao{-4}\heiti{\defTitleCn}}{\zihao{-4}\heiti{\fillType}}}
    
    \fancyfoot[C]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0.75pt}
    % \renewcommand{\headheight}{13pt}
    \setlength{\headwidth}{\textwidth}% 页眉宽度=正文宽度
    \setlength{\headheight}{15pt}% 页眉高度
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




%-------------------------------------
% 以下内容：自定义函数 用来设置模板
%-------------------------------------
\RequirePackage{xstring}      % 正文标题中替换换行
\RequirePackage{datetime}     % 日期

% \def\defTitleCn{} %定义一个变量
% \newcommand{\mytitle}[1]{\def\defTitleCn{#1}} %传参给这个变量

% \def\defFillAuthorCn{}
% \newcommand{\fillAuthorCn}[1]{\def\fillAuthorCn{#1}}}% 这样写会自我覆盖，没有用到变量，只能传参一次

%普通的 \newcommand 定义的命令在某些环境（比如 \section{}、\caption{} 或 PDF 书签）中可能失效或报错。
\DeclareRobustCommand{\fillType}{浙江工业大学硕士学位论文}
\DeclareRobustCommand{\zjutType}[1]{\renewcommand{\fillType}{#1}}

\def\defTitleCn{}% 中文题目
\newcommand{\fillmytitle}[1]{\def\defTitleCn{#1}}
\def\defTitleEn{}% 英文题目
\newcommand{\fillmyTITLE}[1]{\def\defTitleEn{#1}}
\def\defKeywords{}% 关键词
\newcommand{\fillKeywords}[1]{\def\defKeywords{#1}}
\def\defPageNums{}% 总页数
\newcommand{\fillPageNums}[1]{\def\defPageNums{#1}}

%指导老师
\def\defSupervisor{}%导师姓名
\newcommand{\fillsupervisor}[1]{\def\defSupervisor{#1}}
\def\defSupervisorTitle{}%导师职称
\newcommand{\fillsupervisorTitle}[1]{\def\defSupervisorTitle{#1}}
\def\defSupervisorEn{}%导师姓名(英)
\newcommand{\fillsupervisorEn}[1]{\def\defSupervisorEn{#1}}
\def\defSupervisorTitleEn{}%导师职称(英)
\newcommand{\fillsupervisorTitleEn}[1]{\def\defSupervisorTitleEn{#1}}
%第二导师
\def\defSecondSupervisor{}%导师姓名
\newcommand{\fillSecondsupervisor}[1]{\def\defSecondSupervisor{#1}}
\def\defSecondSupervisorTitle{}%导师职称
\newcommand{\fillSecondsupervisorTitle}[1]{\def\defSecondSupervisorTitle{#1}}
\def\defSecondSupervisorEn{}%导师姓名(英)
\newcommand{\fillSecondsupervisorEn}[1]{\def\defSecondSupervisorEn{#1}}
\def\defSecondSupervisorTitleEn{}%导师职称(英)
\newcommand{\fillSecondsupervisorTitleEn}[1]{\def\defSecondSupervisorTitleEn{#1}}

\def\defChairman{}%答辩主席
\newcommand{\fillchairman}[1]{\def\defChairman{#1}}
\def\defReviewer{}%评阅人
\newcommand{\fillReviewer}[1]{\def\defReviewer{#1}}
\def\defReviewerMember{}%答辩委员会成员
\newcommand{\fillReviewerMember}[1]{\def\defReviewerMember{#1}}

\def\defAuthorCn{}%作者中文名
\newcommand{\fillAuthorCn}[1]{\def\defAuthorCn{#1}}
\def\defAuthorEn{}%作者英文名
\newcommand{\fillAuthorEn}[1]{\def\defAuthorEn{#1}}
\def\defAuthorNum{}%学号
\newcommand{\fillAuthorNum}[1]{\def\defAuthorNum{#1}}


\def\defStudyYears{}%专业
\newcommand{\fillStudyYears}[1]{\def\defStudyYears{#1}}
\def\defMajor{}%专业
\newcommand{\fillMajor}[1]{\def\defMajor{#1}}
\def\defAcademic{}%学位类型
\newcommand{\fillAcademic}[1]{\def\defAcademic{#1}}
\def\defCultiviate{}%研究生类别
\newcommand{\fillCultiviate}[1]{\def\defCultiviate{#1}}
\def\defCollege{}%学院
\newcommand{\fillCollege}[1]{\def\defCollege{#1}}
\def\defResearchArea{}%研究领域
\newcommand{\fillresearchArea}[1]{\def\defResearchArea{#1}}

\def\defYear{}
\newcommand{\fillYear}[1]{\def\defYear{#1}}
\def\defMonth{}
\newcommand{\fillMonth}[1]{\def\defMonth{#1}}
\def\defDay{}
\newcommand{\fillDay}[1]{\def\defDay{#1}}


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
    \vspace*{1ex}
    % 摘要
    \begin{center}
        {\zihao{3}\heiti \defabstractname}
    \end{center}
    % 垂直空间
    \vspace*{1ex}
    
    % 摘要实际内容
    #1}
% 英文摘要
\newcommand{\ABSTRACT}[1]{%
    %\noindent {\bfseries {[\defABSTRACTNAME]}} #1}
    % 垂直空间
    \vspace*{1ex}
    % Abstract
    \begin{center}
        {\zihao{3}\heiti \defABSTRACTNAME}
    \end{center}
    % 垂直空间
    \vspace*{1ex}
    
    % 摘要实际内容
    #1}

% 中文关键词
\newcommand{\keywords}[1]{%
    %\vspace{\baselineskip}
    \vspace{1ex}
    \noindent { \heiti\bfseries {\defkeywords} } #1}
% 英文关键词
\newcommand{\KEYWORDS}[1]{%
    %\vspace{\baselineskip}
    \vspace{1ex}
    \noindent {\bfseries {\defKEYWORDS}} #1}



% 超链接相关 -------------------------------------------
% 为减少可能的冲突，习惯上将 hyperref 宏包放在其它宏包之后调用
% 对于章节命令 \chapter、 \section等，默认情况下会为 PDF 自动生成书签
% bookmarks=⟨true|false⟩ 默认生成书签
% hidelinks=true 取消链接的颜色和边框
% bookmarksnumbered=true 书签带章节号
\usepackage[hidelinks,bookmarksnumbered=true]{hyperref}

% ---------------------------------
% 自动引用
% 使用方法 \cref{label1,[label2,...]}
% ----------------------------------
\RequirePackage{cleveref}% 载入自动引用宏包
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{section}{节}{节}
\crefname{subsection}{小节}{小节} 
% 需要new命令，不是renew
\newcommand{\crefpairconjunction}{和}      % 两个引用之间用“和”
\newcommand{\crefmiddleconjunction}{，}    % 多个引用之间的中间部分
\newcommand{\creflastconjunction}{和}      % 多个引用最后两个之间用“和”