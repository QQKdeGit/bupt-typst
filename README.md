# 北京邮电大学本科学士学位论文模板

北邮苦 Word 和 LaTeX 久矣，于是就出现了用 [Typst](https://github.com/typst/typst) 编写的毕业论文模板。

**但是现在还没开发完！不能用！**

**但是现在还没开发完！不能用！**

**但是现在还没开发完！不能用！**

😅 因为 Typst 实在太新了，以至于不支持某些功能，导致我并不能把论文模板具有的要素全部复刻出来。等某些功能支持了，再陆陆续续完善吧。

欢迎提出任何 Issue 和 PR 帮助完善这个模板（不过得事先留言，避免撞车）。



## 使用方法

进入 [Typst 官网](https://typst.app/) ，并将本模板的文件导入进去，但是你还需要导入一些**在线编辑器暂不支持**的字体（比如 `Times New Roman` 和 `楷体`），最终你的目录看起来会像是这个样子：

```
- main.typ
- template.typ
- Times New Roman Bold.ttf
- Times New Roman.ttf
- FZKTK.ttf
```

然后只要修改 `main.typ` 就可以了

有关字体的更多问题可见 [#416](https://github.com/typst/typst/issues/416)

## 尚未实现

- [ ] 目录
- [x] 一级序号和标题居中；二级序号和标题顶格；三级及以下标题“首行缩进” 2 字符
- [x] 图片
- [ ] 表格
- [ ] 页面脚注（开发人员说后续会加上的 [#222](https://github.com/typst/typst/discussions/222)）
- [ ] 页码字体改为小五号 Times New Man
- [x] 数学公式
- [ ] 参考文献

...



## 已知问题

- [x] 默认第一段的段首无法自动空两格，必须要自己额外给第一段添加
- [x] 章节无法自动换页，需要手动输入 `#pagebreak()` 
- [ ] 多行公式时，公式标号没有垂直居中