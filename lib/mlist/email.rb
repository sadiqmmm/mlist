module MList
  
  class Email < ActiveRecord::Base
    set_table_name 'mlist_emails'
    
    include MList::Util::EmailHelpers
    include MList::Util::TMailReaders
    
    def been_here?(list)
      tmail.header_string('x-beenthere') == list.address
    end
    
    def date
      if date_from_email = super
        return date_from_email
      else
        self.created_at ||= Time.now
      end
    end
    
    def from
      tmail.header_string('from')
    end
    
    # Answers the usable destination addresses of the email.
    #
    def list_addresses
      bounce? ? tmail.header_string('to').match(/\Amlist-(.*)\Z/)[1] : extract_list_addresses.collect(&:downcase)
    end
    
    # Answers true if this email is a bounce.
    #
    # TODO Delegate to the email_server's bounce detector.
    #
    def bounce?
      tmail.header_string('to') =~ /mlist-/
    end
    
    def tmail=(tmail)
      @tmail = tmail
      write_attribute(:source, tmail.port.read_all)
    end
    
    def tmail
      @tmail ||= TMail::Mail.parse(source)
    end
    
    # Provide reader delegation to *most* of the underlying TMail::Mail
    # methods, excluding those overridden by this Class and the [] method (an
    # ActiveRecord method).
    def method_missing(symbol, *args, &block) # :nodoc:
      if symbol.to_s !~ /=\Z/ && symbol != :[] && symbol != :source && tmail.respond_to?(symbol)
        tmail.__send__(symbol, *args, &block)
      else
        super
      end
    end
    
    def respond_to?(method)
      super || (method.to_s !~ /=\Z/ && tmail.respond_to?(method))
    end
    
    protected
      def extract_list_addresses
        (Array(tmail.to) + Array(tmail.cc)).uniq
      end
  end
end