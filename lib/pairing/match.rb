module Pairing
  class Match
    def initialize(messenger)
      @messenger = messenger
    end

    def cas(cas)
      @cas = cas
      @messenger.puts "Cas has values : #{cas.join(', ')}"
    end

    def temoin(temoin)
      @temoin = temoin
      @messenger.puts "Temoin has values : #{temoin.join(', ')}"
    end

    def find
      result = 0
      @cas = @cas.to_a.flatten
      @cas.each_with_index do |value, index|
        if index == 0
          @messenger.puts "Checking if #{@temoin[index]} is within #{value - 1} - #{value + 1}"
          # the first cas_value must be = temoin_value +/- 1
          if @temoin[index].between?(value - 1, value + 1)
            result += 1
          end
        else
          # the second and third cas_value must be = temoin_value +/- 2
          if @temoin[index].between?(value - 2, value + 2)
            @messenger.puts "Checking if #{@temoin[index]} is within #{value - 1} - #{value + 1} "
            result += 1
          end
        end
      end
      if result == 0
        @messenger.puts "No match."
      else
        @messenger.puts "#{result} match(es)"
      end
    end
  end
end
