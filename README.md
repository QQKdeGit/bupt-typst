# 北京邮电大学本科学士学位论文模板

本项目 fork 自 [bupt-typst](https://github.com/QQKdeGit/bupt-typst)

## 字体

模版使用的默认黑体为「[思源黑体](https://github.com/adobe-fonts/source-han-sans)」；默认宋体为「[思源宋体](https://github.com/adobe-fonts/source-han-serif)」。如需修改，可将 `template.typ` 文件中 `FONTSET` 里的 `Hei` 和 `Song` 改为你想要的字体（例如 `"STHeiti"` 和 `"STSong"`，即华文黑体和华文宋体）。

## 在线编辑

你可以通过 [Typst 官网](https://typst.app) 在线编辑，具体使用见 [bupt-typst](https://github.com/QQKdeGit/bupt-typst)。

## 本地编译

### macOS

通过 HomeBrew 安装 typst：
```
brew install typst
```

之后在你的工作目录编译 `main.typ`：
```
typst compile main.typ
```

这将会在你的工作目录生成一个 `main.pdf`。

如果你使用 Visual Studio Code 并且安装了 `Typst LSP` 插件，则默认会在文件保存时自动编译成 pdf。

### Windows

见 [Typst 仓库](https://github.com/typst/typst) 的 `README` 中 Installation 一节。

## 其他

- typst 在 0.9.0 (2023/10/31) 版本新增了中西文之间自动添加空格的功能，但似乎有 bug。
- 参考文献的标准应该是 `GB/T 7714-2015`，但 typst 官方给的 bibliography 文档中 style 字符串的值是 `"gb-7114-2015-numeric"`。
- 参考文献的格式仍有错误，无论是指定 style 为 `"gb-7114-2015-numeric"` 或是使用自定义的 `.csl` 文件。
- 有的段落没有缩进，你可以在它的上一行添加一个 `#h(2em)` 来实现缩进（中间不要有空行）。例如：

    ```
    = 标题

    #h(2em)
    我原本没有缩进，但是由于上面这行函数，现在我有了缩进。
    ```