module Python
  class Configuration
    require "rubypython"

    class << self
      def initialize
        # start the Python VM
        RubyPython.start_from_virtualenv("./venv")

        # Add this folder as search path
        sys = RubyPython.import('sys')
        sys.path.append(File.dirname(__FILE__))
      end
    end
  end
end
