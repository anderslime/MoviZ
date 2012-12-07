module Python
  class Configuration
    require "rubypython"

    class << self
      def initialize
        # start the Python VM
        RubyPython.start(:python_exe => "python2.7")

        # Add this folder as search path
        sys = RubyPython.import('sys')
        sys.path.append(File.dirname(__FILE__))
      end
    end
  end
end
