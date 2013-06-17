# encoding: UTF-8

# tell application "BBEdit"
#
# 	set theScript to selection as text
# 	set clippingFileRef to (path to temporary items as string) & "clipping_as_selection"
#
# 	--close access clippingFileRef
# 	set fileref to open for access file clippingFileRef with write permission
# 	set eof of fileref to 0 -- clear the file
# 	write theScript to fileref
# 	close access fileref
#
# 	insert clipping clippingFileRef into window 1
# end tell
require 'tempfile'
require 'bbedit_tools/applescript'

module BBEdit
  class Clipping < Struct.new(:text)
    include Applescript

    def tempfile
      Tempfile.open('bbedit_clipping') do |f|
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
  end
end