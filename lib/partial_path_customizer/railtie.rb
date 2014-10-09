require 'partial_path_customizer/partial_path_helper'

module PartialPathCustomizer
  class Railtie < Rails::Railtie
    initializer 'partial_path_customizer.helpers' do |app|
       ActionView::Base.send :include, PartialPathCustomizer::PartialPathHelper
    end
  end
end
