module MailMod
  module Demo
    def show_parts(part)
      part.parts.each do |p|
        puts
        puts "---- PART ----"
        puts p.content_type
        puts p.content_body if p.mime_type =~ /text/
        show_parts(p) if p.multipart
      end
    end
  end
end