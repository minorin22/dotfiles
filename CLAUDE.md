# 新Macセットアップ用レポジトリ

## 概要
- 新しく購入したM1Max MacBook Pro 16inch 32C/64GB/4TB/Tahoe26.2をセットアップする
- アカウント作成とicloudログイン、finderやdock等のGUIの調整のみ終わったところ
- 今後のことを考えて、環境をIaCとして整備したい

## 用途
- AIエージェントと協働するコーディング、開発全般（C/C++、python、nodejs）
- 2Dアート（Photoshop、Illustrator、Clip Studio Paint）
- 3Dアート（Rhinoceros、Blender、Unreal Engine、Twinmotion）
- メモ書き、論文執筆（Obsidian、Latex）


## 方針
- Electronアプリのうち、PWAで代替可能なもの（Discord、Slack等はネイティブインストールしない）
- 旧マシンのBrewfileたちとApplicationlistを見て、これからの用途を考えて、新しいBrewfileを作る
- 今のdotfilesのアンチパターンを発見して、2026年にふさわしいdotfilesを作る
- 今回は今の.zshrcのようにrosetta用のシェル環境は作らない。x86_64用のシェル環境がほしい時はdockerでやる
- 基本的にRosettaでしか動かないアプリは入れない
- 今の新Macでコマンド1発で全ての環境が整うのが理想。スクリプト頑張って作ろう
　