module Proplog
  module Expression
    class Parser
      class << self
        def parse(string)
          #simple version for now, to be replaced by 
          #shunting algorithm at a later date.
          arr = string.split(" ")

          if(arr[1] == "&")
            return Expression::Conjunction.new(arr[0], arr[2])
          elsif(arr[1] == "|")
            return Expression::Disjunction.new(arr[0], arr[2])
          end
        end
      end

      private

    end
  end
end
