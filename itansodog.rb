# frozen_string_literal: true

require 'itansodog'

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
    message  = "`!omikuji : おみくじが引けます。\n"
    message += "!d1d100 : 1D100のサイコロを振ります。\n"
    message += "!janken : じゃんけんをします。（未実装）\n"
    message += "!wan : ワン！\n"
    message += "!help : このテキストを表示します。\n`"
  end

  event.respond(help_message)
end

###おみくじ###
bot.command(:omikuji) do |event|

  number = rand(1..10)

  if number == 1
      unsei = "大吉！ワン！"
    elsif number == 2 
    　unsei = "犬吉。ワン！！！"
    elsif number <= 3
      unsei = "中吉。"
    elsif number <= 5
      unsei = "小吉。"
    elsif number <= 7
      unsei = "吉。"
    elsif number <= 9
      unsei = "凶。"
    else
      unsei = "大凶。ｸｩｰﾝ..."
  end

  event.respond "#{unsei}"
end

###ダイスロール###
bot.command(:d1d100) do |event|
  num = rand(1..100)
  event.respond "1d100= #{num}"
end


###ワン！！###
bot.command(:wan) do |event|
  event.respond "ワン！！"
end


###ブキルーレット（簡易）###
#bot.command(:buki) do |event|

#  roulette = rand(1..8)

#  if roulette == 1
#      weapon = "ノヴァをもうちょっと信じてみよう"
#    elsif roulette == 2
#      weapon = ".52ガロンデコ"
#    elsif roulette == 3
#      weapon = "ヒーローブラシ"
#    elsif roulette == 4
#      weapon = "エクスプロッシャーカスタム"
#    elsif roulette == 5
#      weapon = ".52ガロンベッチュー"
#    elsif roulette == 6
#      weapon = "人速黒ZAP"
#    else
#      weapon = "薬飲んで、寝ろ"
#  end

#  event.respond "今日は#{weapon}。"
#end

###じゃんけん（仮）###
bot.command(:janken) do |event|
  jnkn = rand(1..3)

  if jnkn == 1
      rsp = "ぐー！"
    elsif jnkn == 2
      rsp = "ちょき！"
    else
      rsp = "ぱー！"
  end

  event.respond "#{rsp}"

end

bot.run
