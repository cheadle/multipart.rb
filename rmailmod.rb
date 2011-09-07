#!/usr/bin/ruby
require 'parser.rb'
require 'part.rb'
require 'email.rb'
require 'header.rb'
require 'demo.rb'

include MailMod::Demo

email = MailMod::Email.new('multipart_email.txt')

puts
puts '-------- EMAIL HEADER ---------'
puts email.header.fields['To']
puts email.header.fields['From']
puts email.header.fields['Subject']
puts email.header.fields['Date']
puts '-------------------------------'

show_parts(email)




  