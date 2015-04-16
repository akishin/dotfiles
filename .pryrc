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

# https://github.com/cldwalker/hirb/issues/81
if defined? Hirb
  Pry.config.print = proc do |*args|
    Hirb::View.view_or_page_output(args[1]) || Pry::DEFAULT_PRINT.call(*args)
  end
end
