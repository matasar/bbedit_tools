module BBEdit
  module Applescript
    def run_applescript(message)
      pipe = IO.popen("osascript - >/dev/null", "w")
      pipe.puts(self.applescript)
      pipe.puts('"' + message + '"')
      pipe.close
    end
  end
end
