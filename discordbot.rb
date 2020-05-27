# frozen_string_literal: true

require 'discordrb'

TOKEN = ENV['DISCORD_BOT_TOKEN']
TOKEN.freeze

bot = Discordrb::Commands::CommandBot.new token: TOKEN, prefix: '!'

bot.command(:ping) do |event|
  event.respond 'pong!'
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
bot.command(:1d100) do |event|
  num = rand(1..100)
  event.respond "1d100= #{num}"
end

bot.run
