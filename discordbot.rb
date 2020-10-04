# frozen_string_literal: true

require 'discordrb'

TOKEN = ENV['DISCORD_BOT_TOKEN']
TOKEN.freeze

bot = Discordrb::Commands::CommandBot.new token: TOKEN, prefix: '!'

###ping!pong!###
bot.command(:ping) do |event|
  event.respond 'pong!'
end

### help ###
bot.command(:help) do |event|

  def help_message
    message  = "`!omikuji : おみくじが引けるよ。試しに一回引いてみない？\n"
    message += "!d1d100 :1D100のサイコロを振るよ。何が出るかな？\n"
    message += "!nyan : にゃーん！\n"
    message += "!ping : テスト用。\n"
    message += "!help : これ。\n`"
  end

  event.respond(help_message)
end

###おみくじ###
bot.command(:omikuji) do |event|

  number = rand(1..10)

  if number == 1
      unsei = "大吉！良かったね。"
    elsif number <= 3
      unsei = "中吉。"
    elsif number <= 5
      unsei = "小吉。"
    elsif number <= 7
      unsei = "吉。"
    elsif number <= 9
      unsei = "凶。"
    else
      unsei = "大凶...でもいいことあるさ。"
  end

  event.respond "#{unsei}"
end

###ダイスロール###
bot.command(:d1d100) do |event|
  num = rand(1..100)
  event.respond "1d100= #{num}"
end


###にゃーん###
bot.command(:nyan) do |event|
  event.respond "にゃーん"
end


###ブキルーレット（簡易）###
bot.command(:buki) do |event|

  roulette = rand(1..8)

  if roulette == 1
      weapon = "ノヴァをもうちょっと信じてみよう"
    elsif roulette == 2
      weapon = ".52ガロンデコ"
    elsif roulette == 3
      weapon = "ヒーローブラシ"
    elsif roulette == 4
      weapon = "エクスプロッシャーカスタム"
    elsif roulette == 5
      weapon = ".52ガロンベッチュー"
    elsif roulette == 6
      weapon = "人速黒ZAP"
    else
      weapon = "薬飲んで、寝ろ"
  end

  event.respond "今日は#{weapon}。"
end


bot.run
