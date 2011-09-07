module MailMod
  module Parser
    def parse(part)
      part_strings = part.content_body.split('--' + part.boundary)

      part_strings.each do |ps|
        if is_part?(ps)
          new_part = MailMod::Part.new(ps)
          part.parts << new_part
          parse(new_part) if new_part.multipart 
        end
      end 
    end

    def is_part?(str)
      /^Content-Type: / =~ str ? true : false
    end
    
    def show_mime_content(part, mime)
      part.parts.each do |p|
        puts p.content_body if p.mime_type == mime
        show_mime_content(p, mime) if p.multipart
      end
    end
    
    def collect_attachments(part)
      # TODO parse header for Content-Disposition and collect attachments
    end
  end
end