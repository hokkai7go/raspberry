# coding: utf-8
require "net/irc"

class TestBot < Net::IRC::Client

  def on_rpl_welcome(m)
    post JOIN, opts.channel
    post PRIVMSG, opts.channel, "hoge"
    post NOTICE, opts.channel, "#{ARGV[0]}"
  end

  def on_privmsg(m)
    channel, message = *m
    if message.force_encoding('utf-8') =~ /ミサワ/
      post NOTICE, channel, messages.shuffle.first
    end
  end

  def messages
    ["カチャカチャ・・・ターンッ!",
      "マジ飽きわたー ほんと飽きた あれまだやってる奴いるの? ほんと飽きたわー! 俺が一番先に飽きたわー",
      "俺の暴走を止められるのはお前と火曜の定期メンテナンスだけだぜ",
      "ねぇ、今実行委員呼んでた?"]
  end
end

irc = TestBot.new("irc.livedoor.ne.jp",
                  6667,
                  :nick => "hokkai7go_bot",
                  :user => "hokkai7go_bot",
                  :real => "hokkai7go_bot",
                  :channel => "#hokkai7go")

irc.start
