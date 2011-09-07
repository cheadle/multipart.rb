module MailMod
  
  class Email < Part
    include MailMod::Parser
    
    def initialize(path)
      s = File.open(path, "rb").read
      super(s)
      parse(self)
    end
    
    def html
      show_mime_content(self, 'text/html')
    end
    
    def text
      show_mime_content(self, 'text/plain')
    end
    
    def attachments
      # TODO add attachment parser
      # collect_attachements(self)
    end
  end
  
end