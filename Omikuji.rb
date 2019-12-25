require 'slack-ruby-client'
  Slack.configure do |conf|
    conf.token = 'xoxb-701987401137-868460815488-jjsMW1kSMXmUCQTzQKBAXilO'
  end
  
  
  client = Slack::RealTime::Client.new
  
  client.on :hello do
    puts 'connected!'
    client.message channel: 'your_channel_id', text: 'connected!'
  end

  i = -1
  hiragana = "ひらがなで答えてね"
  atari = ["ふらいぱん","かまど","たけ","ばんそうこう","らいたー"]
  kuizu = ["パンはパンでも食べられないパンはなんだ？#{hiragana}",
    "窓は窓でも、ご飯が炊ける窓は何だ？#{hiragana}",
    "畑にあるけど、畑では育たない植物はなんだ？#{hiragana}",
    "夜になると走り出しちゃうものってなんだ？#{hiragana}",
    "火も付けられるし、字も書けるものって何？#{hiragana}"
  ]
 
  client.on :message do |data|
    if data['text'].include?('おみくじ')
        lucky="ラッキーアイテムは"
        omikuji = ["大吉です。#{lucky}黒のマフラーです。",
        "吉です。#{lucky}スカイブルーのマフラーです。",
        "中吉です。#{lucky}緑のカーディガンです。",
        "小吉です。#{lucky}チョコレートです。",
        "末吉です。#{lucky}グミです。",
        "凶です。#{lucky}赤ペンです。",
        "大凶です。#{lucky}小銭入れです。",
        ]
        message = omikuji.sample
        client.message channel: data['channel'], text: message
    end
    if data['text'].include?('コロコロ')
        r = rand(1..6)
        saikoro = "出た目は#{r}です"
        client.message channel: data['channel'], text: saikoro
    end
    if data['text'].include?('クイズ出して')
        i = rand(3)
        client.message channel: data['channel'], text: kuizu[i]
    end
    if data['text'].chomp == atari[i].chomp 
        answer = "正解です"
        client.message channel: data['channel'], text: answer
    end
  end

client.start!