#import "template.typ": bachelor_conf,seu_bibliography,appendix,acknowledgment
#import "@preview/funarray:0.3.0":cycle
#import "utils.typ": paragraph,set_doc_footnote,subfigure
#import "@preview/tablex:0.0.8": tablex,vlinex,hlinex,colspanx,rowspanx
#show :doc => set_doc_footnote(doc)   //由于Typst目前的缺陷，footnote必须在开头设置。未来可能会改进。
#let info = (
 title : [基于四十二号混凝土的意大利面配料方案研究],
 student_id : [12345678],
 name : [张三],
 college : [霍格沃兹学院],
 major : [母猪产后护理],
 supervisor : [李四],
 duration : "2023.1.1~2024.1.1",
 
 zh_abstract : [
  摘要内容独立于正文而存在，是论文内容高度概括的简要陈述，应准确、具体、完整地概括论文的主要信息，内容包括研究目的、方法、过程、成果、结论及主要创新之处等，不含图表，不加注释，  具有独立性和完整性，一般为400字左右。

  “摘要”用三号黑体加粗居中，“摘”与“要”之间空4个半角空格。摘要正文内容用小四号宋体，固定1.5倍行距。

  论文的关键词是反映毕业设计（论文）主题内容的名词，一般为3-5个，排在摘要正文部分下方。关键词与摘要之间空一行。关键词之间用逗号分开，最后一个关键词后不加标点符号。
  ],

 zh_key_words : ("关键词1","关键词2","关键词3","关键词4"),

 en_abstract : [英文摘要应与中文摘相对应，250 个实词左右。采用第三人称介绍该学位论文内容，叙述的基本时态为一般现在时，确实需要强调过去的事情或者已经完成的行为才使用过去时、完成时等其他时态。

  ABSTRACT 为三号 Times New Roman 加粗居中。

  英文摘要正文为小四号 Times New Roman，固定 1.5 倍行距。英文关键词“KEY WORDS”大写，其后的关键词第一个字母大写，关键词之间用半角逗号隔开。

  #lorem(250)
  ],

 en_key_words : ("Keywords1","Keywords2","Keywords3","Keywords4")
)
#show :doc => bachelor_conf(
  doc,
  ..info
) //对以下文本应用模板

= 绪论

== 课题背景和意义

绪论部分主要论述选题的意义、国内外研究现状以及本文主要研究的内容、研究思路以及内容安排等~@calandra2015learning@luketina2019survey。

章标题为三号黑体加粗居中；一级节标题（如，2.1 本文研究内容）：四号黑体居左；二级节标题（如，2.1.1 实验方法）：小四号宋体居左。

正文部分为小四号宋体，行间距1.5倍行距，首行缩进2个字符。

== 研究现状
......

== 本文研究内容
......

= 正文
正文部分每一章应另起页书写书写，层次要清楚，内容要有逻辑性，正文一般不少于15000字。正文部分因学科、选题特点可有差异，但必须言之成理，论据可靠，严格遵循本学科国际通行的学术规范。

中文为小四号宋体，英文及数字为小四号Times New Roman，首行缩进2个字符，行间距为1.5倍。

== 插图格式要求

插图力求精炼，且每个插图均应有图序和图名。图序与图名位于插图下方，图序默认按章节编排，如@fig:rain_dist（第二章第1个图），在插图较少时可以全文连续编序，如图10。设置`bachelor_conf(continuous_index:true,...)`启用连续编序。

如一个插图由两个及以上的分图组成，分图用(a)、(b)、(c)等标出，并标出分图名。如@subfig:v_set

简单文字图可用Typst直接绘制，复杂的图考虑使用相应的图形绘制软件完成，以提高图形表达质量~@sanh2021multitask。目前Typst不支持插入PDF图像，矢量图请转为SVG格式。

插图居中排列，与上文文本之间空一行。图序图名设置为五号宋体居中，图序与图名之间空一格。

#figure(
  image("figures/Picture1.png",width:50%),
  //kind:image   figure会自动识别kind，无需手动指定
  caption: [每小时降水量24小时均值分布图]
)<fig:rain_dist>

#figure(
  grid(
    columns: (1fr,1fr), //两列，列宽1:1
    [#subfigure(image("figures/Picture2.png",height:6cm),caption:[速度障碍集合])<subfig:v_set>], //label必须在content块里。
    subfigure(image("figures/Picture3.png",height:6cm),caption:[避免碰撞集合])
  ),
  caption:[速度障碍法速度选择]
)

== 表格格式要求
表格的结构应简洁，一律采用三线表，应有表序和表名，且表序和表名位于表格上方。表格可以逐章单独编序（如：@tab:rain_rate），也可以统一编序（如：表10），采用哪种方式应和插图及公式的编序方式统一。表序必须连续，不得重复或跳跃。

表格无法在同一页排版时，可以用续表的形式另页书写，续表需在表格右上角表序前加“续”字，如“续表2.1”，并重复表头。

表格居中，边框为黑色直线1磅，中文为五号宋体，英文及数字为五号Times New Roman字体，表序与表名之间空一格，表格与下文之间空一行。


//tablex详细用法参见文档 https://github.com/typst/packages/tree/main/packages/preview/tablex/0.0.8
#figure(
  tablex(
    auto-lines:false,
    columns:cycle((1fr,),3), //三列，等宽
    rows:1.8em, //行高
    stroke:1pt, //线宽
    align:center+horizon,
    hlinex(),
    [降水率(mm/h)分级],[该等级所占比例(%)],[降水等级描述],
    hlinex(),
    [$0 lt.eq x lt 0.5$],[90.36],[没有雨或雨很小],
    [$0.5 lt.eq x lt 2.0$],[6.41],[小雨],
    [$2.0 lt.eq x lt 5.0$],[2.04],[中雨],
    [$5.0 lt.eq x lt 10.0$],[0.10],[大雨],
    [$10.0 lt.eq x lt 30.0$],[0.73],[大雨到暴雨],
    [$30.0 lt.eq x lt 100.0$],[0.16],[暴雨],
    hlinex()
  ),
  kind:table, //figure暂时无法自动识别tablex种类，需手动指定为table
  caption: [降水率分级统计]
)<tab:rain_rate>

#figure(
  tablex(
    auto-lines:false,
    columns:cycle((1fr,),13), //13列，等宽
    rows:2em,
    stroke:1pt,
    repeat-header:true, //换页时重复表头
    header-rows:2, //表头行数
    align:center+horizon,
    hlinex(),
    [],colspanx(4)[Stage 1 (>7.1 μm)],(),(),(),colspanx(4)[Stage 2 (4.8-7.1 μm)],(),(),(),colspanx(4)[Stage 3 (3.2-4.7 μm)],(),(),(),
    hlinex(),
    [],[Con],[Low],[Medium],[High],[Con],[Low],[Medium],[High],[Con],[Low],[Medium],[High],
    hlinex(),
    [H],[2.52],[2.58],[2.57],[2.24],[2.48],[2.21],[2.21],[2.36],[2.66],[2.65],[2.64],[2.53],
    [E],[2.52],[2.58],[2.57],[2.24],[2.48],[2.21],[2.21],[2.36],[2.66],[2.65],[2.64],[2.53],
    hlinex()
  ),
  kind:table,
  caption: [室外细菌气溶胶香农-维纳指数（H）和均匀性指数（E）]
)

#figure(
  tablex(
    auto-lines:false,
    columns:cycle((2.4cm,),5), //五列，列宽2.4cm
    rows:2em,
    stroke:1pt,
    align:center+horizon,
    hlinex(),
    [产品],[产量],[销量],[产值],[比重],
    hlinex(),
    [手机],[11000],[10000],[500],[50%],
    [手机],[11000],[10000],[500],[50%],
    [手机],[11000],[10000],[500],[50%],
    hlinex(),
    [合计],[33000],[30000],[1500],[150%],
    hlinex()
  ),
  kind:table,
  caption: [统计表]
)

#figure(
  tablex(
    auto-lines:false,
    columns:cycle((2.4cm,),5),
    rows:2em,
    stroke:1pt,
    align:center+horizon,
    hlinex(),
    [年度],[产品],[产量],[销量],[产值],
    hlinex(),
    rowspanx(2)[2004],[手机],[11000],[10000],[500],
    (),              [计算机],[1100],[1000],[280],
    hlinex(),
    rowspanx(2)[2004],[手机],[11000],[10000],[500],
    (),              [计算机],[1100],[1000],[280],
    hlinex()
  ),
  kind:table,
  caption: [统计表]
)

== 表达式
论文中的公式应注序号并加圆括号，序号一律用阿拉伯数字连续编序（如（28））或逐章编序（如@eq:1），编号方式应与插图、表格方式一致。序号排在版面右侧，且距右边距离相等。公式与序号之间不加虚线。

长公式在一行无法写完的情况下，原则上应在等号（或数学符号，如“+”、“-”号）处换行，数学符号在换行的行首。

公式及文字中的一般变量（或一般函数）（如坐标$X$、$Y$，电压$V$，频率$f$）宜用斜体，矢量用粗斜体如$bold(S)$或白斜体上加单箭头$limits(S)^arrow$，常用函数（如三角函数 $cos$、对数函数 $ln$等）、数字运算符、化学元素符号及分子式、单位符号、产品代号、人名地名的外文字母等用正体。

公式排版时使用`$ Equation $`，在`Eqaution`和`$`之间留一个空格进入单行公式模式。公式中插入`&`作为对齐符，使用`\ `换行。

$ V_(c e l l)=E_(O C V)-V_(a c t)-V_(0 h m)-V_(c o n c) $<eq:1>
$ E_(O C V)=&1.229-0.85 times 10^(-3)(T_(s t)-T_0)\
            &+4.3085 times 10^(-5)T_(s t)[ln(P_(H_2)/1.01325)+1/2 ln(P_(O_2)/1.01325)] $

== 注释
正文中有个别名词或情况需要解释时，可加注说明，注释采用页末注（将注文放在加注页的下端）。在引文的右上角标注序号①、②、……，如“马尔可夫链#footnote[马尔可夫链表示……]”。若在同一页中有两个以上的注时，按各注出现的先后，顺序编号。引文序号，以页为单位，且注释只限于写在注释符号出现的同页，不得隔页。

注释采用小五号宋体，英文及数字为小五号 Times New Roman 字体，利用`#footnote[]`插入。

= 总结与展望
== 工作总结
最后一章结论与展望着重总结论文的创新点或新见解及研究展望或建议。

结论是对论文主要研究结果、论点的提炼与概括，应准确、简明、完整、有条理，使人看后就能全面了解论文的意义、目的和工作内容。主要阐述自己的创造性工作及所取得的研究成果在本学术领域中的地位、作用和意义。

结论要严格区分自己取得的成果与导师及他人的科研工作成果。在评价自己的研究工作成果时，要实事求是，除非有足够的证据表明自己的研究是“首次”的、“领先”的、“填补空白”的，否则应避免使用这些或类似词语。

== 工作展望
展望或建议，是在总结研究工作和现有结论的基础上，对该领域今后的发展方向及重要研究内容进行预测，同时对所获研究结果的应用前景和社会影响加以评价，从而对今后的研究有所启发。

#seu_bibliography(bib_file:"reference.bib")

#appendix[
= 附录名称
对于一些不宜放入正文中、但作为毕业设计（论文）又不可残缺的组成部分或具有重要参考价值的内容，可编入毕业设计（论文）的附录中，例如，正文内过于冗长的公式推导、方便他人阅读所需的辅助性数学工具或表格、重复性数据和图表、非常必要的程序说明和程序全文、关键调查问卷或方案等。

附录的格式与正文相同，如有多个附录需依顺序用大写字母 A，B，C，……编序号，如附录 A，附录 B，附录 C，……。只有一个附录时也要编序号，即附录 A。每个附录应有标题，如：“附录 A 参考文献著录规则及注意事项”。

附录一般与论文全文装订在一起，与正文一起编页码。
]

#acknowledgment[
学位论文正文和附录之后，一般应放置致谢（后记或说明），主要感谢指导老师和对论文工作有直接贡献和帮助的人士和单位。致谢言语应谦虚诚恳，实事求是。字数一般不超过 1000 个汉字。

“致谢”用三号黑体加粗居中，两字之间空 4 个半角空格。致谢内容为小四号宋体，1.5倍行距。
]