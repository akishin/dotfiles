require 'rubygems' rescue nil
require 'irb/completion'
require 'wirble'
require 'hirb'
require 'hirb-unicode'
require 'pp'
require 'tapp'
require 'awesome_print'

IRB.conf[:PROMPT_MODE]  = :DEFAULT
IRB.conf[:SAVE_HISTORY] = 100000
IRB.conf[:AUTO_INDENT] = true

# load wirble
Wirble.init
Wirble.colorize

# load hirb
Hirb.enable

# Rails Logger Setting
if ENV.include?('RAILS_ENV')
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end

  if ENV['RAILS_ENV'] == 'test'
    require 'test/test_helper'
  end

  # for rails 3
elsif defined?(Rails) && !Rails.env.nil?
  if Rails.logger
    Rails.logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
  if Rails.env == 'test'
    require 'test/test_helper'
  end
else
  # nothing to do
end

