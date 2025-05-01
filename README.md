# 浙江工业大学信息工程学院latex模板

>本模板基于计算机学院程航模板修改而来，修改了题注、字体、行间距、浮动体与正文距离、参考文献等等格式。
>
>借鉴西电字体宏包，在此基础上修改，重写xeCJK的字体命令，如\songti、\heiti、\kaishu

## 使用

### overleaf在线编译

模板因带有fonts目录，整体压缩结果在100M+，需要分开上传

1. 压缩成zip，上传除fonts之外的所有文件
2. 上传fonts
3. 选择编译器为xelatex

懒人食用已上传好的模板（可能不是最新的）：https://cn.overleaf.com/read/hnnmfxmsdmpt#9d9930

### 本地tex环境

clone下来直接使用即可

## 特殊的latex语法

### 图表题注

```
\bicaption{中文题注}{英文题注}
```

### clever交叉引用

```
\cref{图、表、公式的label}
```

