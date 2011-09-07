module MailMod
  
  class Email < Part
    include MailMod::Parser
    
    def initialize(path)
      s = File.open(path, "rb").read
      super(s)
      parse(self)
    end
    
  end
  
end