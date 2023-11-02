# 北京邮电大学本科学士学位论文模板

本项目 fork 自 [bupt-typst](https://github.com/QQKdeGit/bupt-typst)

## 字体

模版使用的默认黑体为「思源黑体」；默认宋体为「思源宋体」。如需修改，可将 `template.typ` 文件中 `FONTSET` 里的 `Hei` 和 `Song` 改为你想要的字体（例如 `"STHeiti"` 和 `"STSong"`，即华文黑体和华文宋体）。

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

## 其他

- typst 在 0.9.0 (2023/10/31) 版本新增了中西文之间自动添加空格的功能，但似乎有 bug。