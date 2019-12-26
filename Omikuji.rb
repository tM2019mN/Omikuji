require 'slack-ruby-client'
  Slack.configure do |conf|
    conf.token = 'xoxb-******************' #tokenは誰かに公開しないでください。
  end         
  
  client = Slack::RealTime::Client.new
  
  #Slack と繋がった時に puts ''の中に記載されている文字がコンソールに出力されます。
  client.on :hello do
    puts 'connected!'
  end

  #クイズの出題と回答でこの変数を使用します。　変数について知りたい方は (Ruby 変数)　について検索。
  i = -1
  
  #クイズの答えです。この書き方良く分からないという方は　(Ruby 配列)　について検索。
  atari = ["ふらいぱん","かまど","たけ","ばんそうこう","らいたー"]

  #クイズの出題です。#{}を使うと変数を文章の中に組み込む事が出来ます。詳しく知りたい方は　(Ruby 変数展開)　について検索。
  hiragana = "ひらがなで答えてね"
  kuizu = ["パンはパンでも食べられないパンはなんだ？#{hiragana}",
    "窓は窓でも、ご飯が炊ける窓は何だ？#{hiragana}",
    "畑にあるけど、畑では育たない植物はなんだ？#{hiragana}",
    "夜になると走り出しちゃうものってなんだ？#{hiragana}",
    "火も付けられるし、字も書けるものって何？#{hiragana}"
  ]
  
  #実際のSlackの処理
  client.on :message do |data|
    if data['text'].include?('おみくじ')
      #おみくじの処理内容
      lucky="ラッキーアイテムは"
      omikuji = ["大吉です。#{lucky}黒のマフラーです。",
      "吉です。#{lucky}スカイブルーのマフラーです。",
      "中吉です。#{lucky}緑のカーディガンです。",
      "小吉です。#{lucky}チョコレートです。",
      "末吉です。#{lucky}グミです。",
      "凶です。#{lucky}赤ペンです。",
      "大凶です。#{lucky}小銭入れです。",
      ]
      #ここでは　変数の代入を行っております。　詳しく知りたい方は　(Ruby 変数更新,Ruby 変数の代入)　について検索
      #sampleはomikujiの中の文字をランダムに出力してくれます。
      kuji = omikuji.sample
      #textにkujiを代入しています。
      client.message channel: data['channel'], text: kuji
    #おみくじの処理はendで終了です。
    end

    if data['text'].include?('コロコロ')
        #サイコロの処理です。rand関数を使って１～６の数字をランダムに出力しています。
        korokoro = rand(1..6)
        saikoro = "出た目は#{korokoro}です"
        client.message channel: data['channel'], text: saikoro
    #サイコロの処理はendで終了です。
    end
  
    if data['text'].include?('クイズ出して')
    #クイズの出題の処理です。
        i = rand(5)
        client.message channel: data['channel'], text: kuizu[i]
    #クイズの処理はendで終了です。
    end

    #クイズの回答についての処理です。回答と答えが一致すればanswerが出力される処理を行っています。
    #chomp関数は文字列の改行を取り除いて、改行なしで出力してくれる関数です。
    if data['text'].chomp == atari[i].chomp 
        answer = "正解です"
        client.message channel: data['channel'], text: answer
    #クイズの回答処理はendで終了です。
    end
  #client.on :messageの処理はここで終了です。
  end

#実際にBotの処理を開始します。
client.start!