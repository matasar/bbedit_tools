# encoding: UTF-8

require 'bbedit_tools/applescript'

module BBEdit
  class Result < Struct.new(:kind, :file, :line, :message)
    def for_bbedit
      [
        "{result_kind:#{kind}, ",
        "result_file:\"#{file}\", ",
        "result_line: #{line}, ",
        "message:\"#{escaped_message}\"}"
      ].join("")
    end

    def escaped_message
      message.gsub(/(["\\])/, '\\\\\1')
    end
  end

  class Note < Result
    def initialize(file, line, message)
      super('note_kind', file, line, message)
    end
  end

  class Warning < Result
    def initialize(file, line, message)
      super('warning_kind', file, line, message)
    end
  end

  class Error < Result
    def initialize(file, line, message)
      super('error_kind', file, line, message)
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
      run_applscscript("Opened BBEdit Browser")
    end
  end
end