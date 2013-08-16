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
    post NOTICE, channel, "#{ARGV[0]}"
  end

end

irc = TestBot.new("irc.livedoor.ne.jp",
                  6667,
                  :nick => "hokkai7go_bot",
                  :user => "hokkai7go_bot",
                  :real => "hokkai7go_bot",
                  :channel => "#hokkai7go")

irc.start
