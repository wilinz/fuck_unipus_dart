# Fuck Unipus

众所周知，`Unipus` 对大学生的压迫已久，`Unipus` 吃相丑陋，为了让学生每个学期都买它的课本，引入了激活码这种反人类的东西，让二手课本不能物尽其用，学生需要额外花几十块钱去买激活码，让本就不富裕的大学生雪上加霜，本项目就是为了干`Unipus` 而生。

本项目是一个 itest && U校园脚本，使用 `dart` 语言编写，相比py的弱类型易于维护，非常优秀的一门语言，架构完美，代码易食用，全平台可运行，完美解决浪费大学生生命的 `Unipus`，解放了生产力。

本项目接入`OpenAi`用来回答问题

## Features

- [x] 使用 AI 进行 `itest` 班级测试，词汇测试，**本项目能自动听听力，是不是非常舒服**

- [x] 遍历`U校园`课程树
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
