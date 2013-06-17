# encoding: UTF-8

require 'tempfile'
require 'bbedit_tools/applescript'

module BBEdit
  class Clipping < Struct.new(:text)
    include Applescript

    def tempfile
      @tempfile ||= Tempfile.open('bbedit_clipping') do |f|
        f.puts(self.text)
        f
      end
    end

    def applescript
      <<-EOS
      tell application "BBEdit"
        set clippingFileRef to "#{tempfile.path}"
        insert clipping clippingFileRef into window 1
      end tell
      EOS
    end

    def insert!
      run_applescript("Inserted clipping")
    end

    def cleanup!
      @tempfile.unlink
    end
  end
end