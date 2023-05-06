# 北京邮电大学本科学士学位论文模板

北邮苦 Word 和 LaTeX 久矣，于是就出现了用 [Typst](https://github.com/typst/typst) 编写的毕业论文模板。

**目前有一个可用的 release 分支。**

😅 但是因为 Typst 实在太新了，以至于不支持某些功能，导致我并不能把论文模板具有的要素全部复刻出来。等某些功能支持了，再陆陆续续完善吧。

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

更多本地编译的使用信息见 [Typst](https://github.com/typst/typst) 仓库的 README.md 。

## 已知问题

- [ ] 页面脚注（开发人员说后续会加上的 [#222](https://github.com/typst/typst/discussions/222)）
- [ ] 多行公式时，公式标号没有垂直居中
- [ ] 参考文献不支持使用 `.bib` 文件

## 注意事项

由于 Typst 仍不太完善，如果设置章节自动换页的话，某些地方会出现神奇的空页。

因此，我保留了一部分章节的**本味**，所以你需要在章节标题的前一行输入 `#pagebreak()` 手动换页。

同时随着 Typst 的不断更新，一些语法会发生改变，有时候我并没有及时跟上它的更新，这有可能会导致 bug 出现。

## FAQ

**为什么模板缺失了封面、诚信声明等其他内容？**

缺失的内容在[北邮的 LaTeX 模板仓库](https://github.com/BYRIO/BUPTBachelorThesis)中的 docs 文件夹中可以找到 word 和 pdf 格式的文件，考虑到一些格式不太适合和支持 Typst ，我并没有在本模板中复刻它。因此本模板负责的内容为论文的正文内容部分，而你需要下载那些缺失内容的文件，编辑 word 文件，导出 pdf ，最后与本模板进行 pdf 拼接。或许在未来随着 Typst 的逐渐完善，这些缺失内容可以直接在本模板中得到复刻。
