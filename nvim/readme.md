<h1 align="center">My Configuration</h1>

[toc]

# 项目整体概览



## ⚙ Install [必须]
```sh
22223
```

## 【可选1】安装 ripgrep 和 fzf

可以帮助加速 telescope，感觉确实有用。

macos :

```shell

```

Fedora：

```shell
dnf install ripgrep fd-find 
```

## 【可选2】安装 coc 插件的依赖 nodejs (>= 12.12)

macos：

```shell
 brew install nodejs
```

[官方方法](https://github.com/neoclide/coc.nvim)：

```shell
curl -sL install-node.vercel.app/lts | bash
```

## 【可选3】安装python3的依赖
```shell
pip3 install --user --upgrade pynvim
```

# 常见错误

## ccls 报错

[coc.nvim] Unable to load global extension at /home/xx_name /.config/coc/extensions/node_modules/coc-ccls: main file ./lib/extension.js not found, you may need to build the project.


```shell
# 解决方法: https://github.com/neoclide/coc.nvim/issues/2088
cd ~/.config/coc/extensions/node_modules/coc-ccls
ln -s node_modules/ws/lib lib
```



# 参考文档

* 中文文档
  * [2022 年 vim 的 C/C++ 配置](./docs/nvim.md)
  * [tig 基于 vim 模式的快捷键介绍](./docs/tig.md)
  * [极简 Alacritty 配置](./docs/alacritty.md)
  * 

本站所有文章转发 **CSDN** 将按侵权追究法律责任，其它情况随意。
