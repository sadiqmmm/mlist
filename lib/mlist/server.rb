module MList
  class Server
    attr_reader :list_manager, :email_server
    
    def initialize(config)
      @list_manager = config[:list_manager]
      @email_server = config[:email_server]
      @email_server.receiver(self)
    end
    
    def receive_email(email)
      lists = list_manager.lists(email)
      if email.bounce?
        process_bounce(lists.first, email)
      else
        process_post(lists, email)
      end
    end
    
    def mail_list(list)
      MailList.find_or_create_by_list(list, @email_server)
    end
    
    protected
      def process_bounce(list, email)
        list.bounce(email)
      end
      
      def process_post(lists, email)
        lists.each do |list|
          if list.subscriber?(email.from_address)
            if list.active?
              mail_list(list).process_email(email)
            else
              list.inactive_post(email)
            end
          else
            list.non_subscriber_post(email)
          end
        end
      end
  end
end