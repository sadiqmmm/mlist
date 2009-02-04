require 'net/smtp'

module MList
  module EmailServer
    
    class Smtp < Base
      def deliver(tmail, destinations)
        sender = tmail['return-path'] || tmail.from
        Net::SMTP.start(settings[:address], settings[:port], settings[:domain],
            settings[:user_name], settings[:password], settings[:authentication]) do |smtp|
          smtp.sendmail(tmail.encoded, sender, destinations)
        end
      end
      
      def execute
        raise "Mail cannot be received through an SMTP server. Please use the '#{MList::EmailServer::Default.name}' type."
      end
    end
    
  end
end