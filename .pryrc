begin
  require 'hirb'
  require 'hirb-unicode'
  require 'tapp'
  require 'awesome_print'
rescue LoadError
  # nop
end

Pry.config.color  = true
Pry.config.editor = "vim"
# Pry.config.pager  = false

#if defined? Hirb
#  Pry.config.print = proc do |output, value|
#      Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
#  end
#end
