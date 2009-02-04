module MList
  module EmailServer
    class Fake < Base
      attr_reader :deliveries
      
      def initialize
        super({})
        @deliveries = []
      end
      
      def deliver(tmail, destinations)
        @deliveries << tmail
      end
    end
  end
end
