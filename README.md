<!--
create time: 2016-02-18 20:06:21
Author: amoblin

This file is created by Marboo<http://marboo.io> template file $MARBOO_HOME/.media/starts/default.md
本文件由 Marboo<http://marboo.io> 模板文件 $MARBOO_HOME/.media/starts/default.md 创建
-->

Mac App Store下载：https://itunes.apple.com/cn/app/gitman/id1274940707?mt=12

# 需求背景

设计师MM需要给开发GG切图，产品MM要给开发GG和设计师MM各种PRD文档，如何方便快速地同步文件呢？抛开QQ微信等IM和Email等传统方式，基于文件夹的现有解决方案有：

1. 各种国内盘
2. Dropbox
3. BitTorrent Sync

这3种解决方案都不够理想：

1. 国内盘的问题有3：信息的隐私安全，没有企业级部署方案，成本太高。
2. Dropbox在国内无法正常使用，要让所有参与者都使用VPN是不现实的。
3. BitTorrent Sync可以说是目前最好的选择了：局域网P2P同步，没有隐私安全问题，普通免费版就够日常开发使用了，而且速度快。但我们在使用过程中发现总是出现丢文件的问题，个人怀疑是P2P的技术架构的问题导致，无法从根本上避免。

在使用了一年多BitTorrent Sync以后，在~~今天~~5月11日吃晚饭的时候终于决定自己开发一款满足以下需求的产品：

1. 隐私安全，局域网同步
2. 稳定，不丢文件
3. 速度快
4. 操作简单，不需要懂太多技术

而这就是[GitMan](https://github.com/amoblin/gitman)。

# [GitMan：基于Git的网盘式文件同步工具](https://github.com/amoblin/gitman)

GitMan是一款基于Git的网盘式文件同步工具，配合局域网Gitlab作为数据交换中心，文件同步速度快。因为基于Git，所以可以保证数据的稳定可靠，不丢文件，并且可访问文件修改历史。使用起来也极为简单，启动GitMan以后，把需要同步的文件夹拖拽到GitMan界面中，然后文件夹里的任何文件修改或添加都会自动同步到远端Git库中，开发就可以像拉取代码一样方便的获取到产品原型图PRD文档、设计标注图、资源切图等。一旦文件有了更新，开发可以实时获取通知提醒，大大降低了沟通成本，提高了工作效率。配合公司内部Gitlab使用，可保障数据的隐私安全。

![](./resources/gitman01.png)

GitMan的特点如下：

1. 基于Git库做同步
2. 稳定，不丢文件，可访问历史
3. 配合局域网Gitlab等，同步速度快
4. 操作简单，只需要拖拽文件到文件夹里即可

好处：

1. 降低生产各环节沟通成本。使产品、交互、设计、开发、测试的信息流动更高效。
2. 数据隐私安全，信息不泄露。配合公司内部Gitlab使用，可保障数据的隐私安全。

不足：

0. 目前只支持OSX系统

具体如何使用呢？且看下文。

## Gitlab和Git配置（这一步由开发GG来协助，这是一劳永逸的配置）

在产品MM或设计师MM的电脑上配置好公私钥对，以及Gitlab账号的访问权限，确保能够免密进行push。

## Git库初始化（这一步由开发GG来协助，每个Git库配置一次即可）

在Gitlab上创建一个git库，用于存放产品文档或切图等资源

git clone下来上述git库，注意使用ssh协议，以保证接下来可以直接push更新仓库。

这些开发GG都懂滴~好机会注意把握哦~

## 下载安装GitMan

https://itunes.apple.com/cn/app/gitman/id1274940707?mt=12

下载安装启动后，把上述文件夹拖入GitMan。

配置完毕，接下来就是日常使用了。

## GitMan使用（产品MM或设计师MM操作）

向Git库文件夹中添加文件即可，方式随意。

## 工程师获取文件更新

```
git pull
```

就酱紫~

GitMan GitHub地址：https://github.com/amoblin/gitman

欢迎star, fork or pull request or giving suggestion!
