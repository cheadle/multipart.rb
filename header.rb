module MailMod
  
  class Header
    attr_reader :fields
    
    def initialize(str)
      @raw = str
      @fields = {}
      @received = [] # TODO capture received headers

      lines = str.gsub(/\n\s+/, ' ').split(/\n/)
      lines.each do |line|
        f = (/(\w+): (.+)/).match(line)
        @fields[f[1]] = f[2] if f
      end
    end
  end
  
end
