module MailMod
  
  class Part
    attr_reader :content_type, :multipart, :mime_type, :boundary, :content_body, :header, :parts
    
    def initialize(str)
      @raw = str
      @content_type = /^Content-Type: (.+)/i.match(@raw)[1]
      @multipart = /multipart\/(.+);/i.match(@content_type) ? true : false
      @mime_type = /^(.+);/i.match(@content_type)[1];
      @boundary = /boundary=(.+)/.match(@content_type)[1] if /boundary=/ =~ @content_type
      @body_index = @raw =~ /\n\n/
      @content_header = @raw.slice(0..@body_index)
      @content_body = @raw.slice(@body_index..@raw.length)
      @header = Header.new(@content_header)
      @parts = []
    end
  end
  
end