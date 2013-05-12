# encoding: UTF-8

module BBEdit
  class Result < Struct.new(:kind, :file, :line, :message)
    def for_bbedit
      "{result_kind:#{kind}, result_file:\"#{file}\", result_line:#{line}, message:\"#{escaped_message}\"}"
    end

    def escaped_message
      message.gsub(/"/, "\\\"")
    end
  end

  class ResultBrowser < Struct.new(:results, :name)
    def initialize(name)
      self.results = []
      self.name = name
    end

    def applescript
      <<-EOS
      tell application \"BBEdit\"
  set error_list to { ¬
    #{results.map{ |ea| ea.for_bbedit}.join(", ¬\n")}}
  make new results browser with data error_list ¬
    with properties {name:\"#{name}\"}
  activate
end tell
      EOS
    end

    def show!
      pipe = IO.popen("osascript - >/dev/null", "w")
      pipe.puts(applescript)
      pipe.puts('"Opened BBEdit Browser"')
      pipe.close
    end
  end
end