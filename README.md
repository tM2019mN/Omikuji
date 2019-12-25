# Omikujibot
    「大吉」や「凶」など、ランダムでおみくじがひける運試しbotです。
    おみくじ関係ありませんが、超簡単なクイズもランダムに出してくれます。

## 目次

- 開発環境
- 起動方法
- 機能・使い方
- 開発背景
- 実施手順
  - Slackbot開発
  - サーバー構築
  - GitHubに公開

## 開発環境

 - Windows 10 or Ubuntu 18.04.3
 - Ruby 2.6.5
 - gem 3.0.3

## 起動方法

1. [Slack Api](https://api.slack.com/apps)

   botのアカウントを作成し、API TOKENを取得してください。

2. GitHubのリポジトリをcloneして、作成されたディレクトリに移動する。
    ```
    $ git clone https://github.com/tM2019mN/OmikujiBot.git
    ```
    ```
    $ cd OmikujiBot
    ```

3. 移動したディレクトリ内にgemをインストール
    ```
    $ bundle install --path vendor/bundle
    ```

4. ソースコードのAPI TOKENを書き換える。
    ```
    $ vi Omikuji.rb
    ```

    ファイル内の ***xoxb-*** で始まるところを、1.で取得したAPI TOKENに書き換えてください。

    > conf.token = ***'xoxb-1234567890abcdefg'***

5. 実行
    ```
    $ bundle exec ruby Omikuji.rb
    ```

6. `connected!` と表示されれば、実行成功です。

## 機能・使い方

 - おみくじ機能

    「おみくじ」というと、おみくじが引けます。

     <img src="https://raw.githubusercontent.com/tM2019mN/OmikujiBot/images/omikuji.jpg" width="320px"> 

 - クイズ機能

    「クイズ出して」というと、クイズをだしてくれます。

     <img src="https://raw.githubusercontent.com/tM2019mN/OmikujiBot/images/quiz.jpg" width="320px">

 - さいころ機能

    「コロコロ」というとさいころをころがせます。

     <img src="https://raw.githubusercontent.com/tM2019mN/OmikujiBot/images/saikoro.jpg" width="320px">


## 開発背景
    本プログラムは、新人2人で調査やスケジュール管理、役割分担をしながら3週間で作成しました。

    Linux仮想サーバを構築し、Rubyで構築したSlackbotをLinuxで動作させ、GitHubに公開。

## 実施手順
    以下を項目順に進める。（参考にさせていただいたWEBサイトを記載しています）

### Slackbot開発

 - [Ruby環境構築](https://techacademy.jp/magazine/7056)
 - [Slackbotアカウントの作成](https://hawksnowlog.blogspot.com/2017/12/create-slack-bot-with-ruby.html)
 - [Rubyで動作確認用Slackbot作成](https://qiita.com/nekonekonekoe/items/b39cc763945bdcef35fb)
 - botにおみくじ機能とサイコロ機能実装
 - botにクイズ機能実装

### サーバ構築

 - [VMware仮想マシン作成](http://namco.hatenablog.jp/entry/2018/04/28/063059)
 - [IPアドレス・DNSサーバ・ゲートウェイ設定](https://linuxfan.info/ubuntu-1804-server-static-ip-address)   
 - [SSH環境設定](https://aquarius-train.hatenablog.com/entry/SSHの設定手順%28Ubuntu18_04%29とWindowsからのアクセス確認手順)
 - [Rubyの環境構築](http://www.aise.ics.saitama-u.ac.jp/~gotoh/RubyByRbenvOnUbuntu1804.html)
 - [サーバーで24時間運用](https://www.atmarkit.co.jp/ait/articles/1708/24/news022.html)

### GitHubに公開
 
 - [個人アカウント作成](https://techacademy.jp/magazine/6235)
 - [チームアカウント作成](https://blog.fakiyer.com/entry/2015/04/27/140638)
 - [README作成](http://www.daipanman.com/entry/2017/09/14/162232)
 - [Gitをインストール](https://howpon.com/4152)
 - [ソースコードをあげる](https://techacademy.jp/magazine/6235)