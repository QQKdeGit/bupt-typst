# 北京邮电大学本科学士学位论文模板

北邮苦 Word 和 LaTeX 久矣，于是就出现了用 [Typst](https://github.com/typst/typst) 编写的毕业论文模板。

**但是现在还没开发完！不能用！**

**但是现在还没开发完！不能用！**

**但是现在还没开发完！不能用！**

😅 因为 Typst 实在太新了，以至于不支持某些功能，导致我并不能把论文模板具有的要素全部复刻出来。等某些功能支持了，再陆陆续续完善吧。

欢迎提出任何 Issue 和 PR 帮助完善这个模板（不过请事先留言，避免撞车）。



## 在线编辑

进入 [Typst 官网](https://typst.app/) ，并将本模板的文件导入进去，但是你还需要导入一些**在线编辑器暂不支持**的字体（比如 `Times New Roman` 和 `楷体`），最终你的目录看起来会像是这个样子：

```
- main.typ
- template.typ
- Times New Roman Bold.ttf
- Times New Roman.ttf
- FZKTK.ttf
```

然后只要修改 `main.typ` 就可以了。

有关字体的更多问题可见 [#416](https://github.com/typst/typst/issues/416) 。

但是目前在线编辑尚不支持多级目录，没办法在里面创建文件夹，这意味着模板中的图片都得放到根目录下才行，希望它后续能支持吧。



## 本地编译

进入 Typst 的 GitHub 仓库，下载 [release](https://github.com/typst/typst/releases) ，解压出 `typst.exe` 放入根目录。

更多使用信息见仓库的 README.md 。



## 尚未实现

- [ ] 目录
- [x] 一级序号和标题居中；二级序号和标题顶格；三级及以下标题“首行缩进” 2 字符
- [x] 图片
- [x] 表格
- [x] 代码块
- [ ] 页面脚注（开发人员说后续会加上的 [#222](https://github.com/typst/typst/discussions/222)）
- [x] 页码字体改为小五号 Times New Man
- [x] 数学公式
- [ ] 参考文献

...



## 已知问题

- [x] 默认第一段的段首无法自动空两格，必须要自己额外给第一段添加
- [ ] 多行公式时，公式标号没有垂直居中
- [ ] 目录中的页码不是小五号 Times New Man



## 注意事项

由于 Typst 仍不太完善，如果设置章节自动换页的话，某些地方会出现神奇的空页。

因此，我保留了一部分章节的**本味**，需要在章节标题的前一行输入 `#pagebreak()` 手动换页。

