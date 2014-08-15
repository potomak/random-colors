require File.expand_path('../../boot',        __FILE__)
require File.expand_path('../../environment', __FILE__)
require 'clockwork'

include Clockwork

every(3.seconds, 'Add a random color') { Color.new.randomize.save }

unless Rails.env.test?
  Thread.new do
    Clockwork.run
  end
end
