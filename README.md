# Fuck Unipus

本项目接入`OpenAi`用来回答问题

## Features

- [x] 使用 AI 进行 `itest` 班级测试，词汇测试，**本项目能自动听听力**
- [x] 自动遍历`U校园`课程树学习
- [x] 完成U校园自动完成
- [x] 完成U校园刷时长`WebSocket`

## Getting started

申请 `OpenAi` api key，推荐 [https://next.ohmygpt.com/apis](https://next.ohmygpt.com/apis) ，纯好用，非广告，`ohmygpt` 官方看到了可以给我打钱。

dart 环境建议使用 choco/brew/apt 安装 fvm 后，再用 fvm 安装 flutter/dart sdk

``````dart
git clone https://github.com/wilinz/fuck_unipus_dart
``````

## Usage

```dart
dart run example/bin/example.dart
```

## Dev information

json to model

```shell
flutter pub run json5_model --src=lib/src/json --dist=lib/src/model  --prefix-regexp "(.+?)_response$"
```
