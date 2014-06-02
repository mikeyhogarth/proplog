require "highline/import"
require "proplog/cli/color_scheme"

module Proplog
  class Cli
    def initialize
      say "<%= color('Proplog #{Proplog::VERSION} CLI', :headline) %>"
      say "Type 'quit' to quit."
      @exit = false
    end

    def run
      while(@exit != true)
        input = ask "> "
        parse input
      end
    end

    def parse(input)
      command_array = input.split(' ')
      cmd = command_array[0].to_sym
      args = command_array[1..command_array.length]

      if(AVAILABLE_COMMANDS.include? cmd)
        begin
          if args.any?
            send(command_array[0], args.join(" "))
          else
            send command_array[0]
          end
        rescue ArgumentError
          error "Wrong Number of arguments for command: #{cmd}"
        end
      else
        error "Unknown Command: #{cmd}"
      end

    end

    private
    def say_boldly msg
      say "<%= color('#{msg}',:bold)%>"
    end

    def error msg
      say "<%= color('#{msg}',:error)%>"
    end

    AVAILABLE_COMMANDS = [:posit, :quit]

    def quit
      say "Goodbye!"
      @exit = true
    end

    def posit(args)
      expr = Proplog::Expression::Parser.parse(args)
      say_boldly expr.to_s
    end
  end
end
