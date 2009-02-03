require 'tmail'
require 'activesupport'
require 'activerecord'

require 'mlist/util'
require 'mlist/message'
require 'mlist/list'
require 'mlist/mail_list'
require 'mlist/email_post'
require 'mlist/email_server'
require 'mlist/email_subscriber'
require 'mlist/server'
require 'mlist/thread'

module MList
end

Time::DATE_FORMATS[:mlist_reply_timestamp] = Date::DATE_FORMATS[:mlist_reply_timestamp] = lambda do |time|
  time.strftime('%a, %b %d, %Y at %I:%M %p').sub(/0(\d,)/, '\1').sub(/0(\d:)/, '\1')
end

TMail::Mail::ALLOW_MULTIPLE['x-beenthere'] = true