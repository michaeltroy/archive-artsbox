if RAILS_ENV == "staging" 
  Paperclip.options[:command_path] = '/usr/bin/' 
else 
  Paperclip.options[:command_path] w= '/usr/local/bin/' 
end

