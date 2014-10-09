require 'partial_path_customizer/presenter'

module PartialPathCustomizer::PartialPathHelper

  def customize_partial_path object, partial_name
    partial_path_proc = proc{|model_name| "#{model_name.pluralize}/#{partial_name}" }

    if object.respond_to?(:map)
      PartialPathCustomizer::Presenter.wrap_collection(object, &partial_path_proc)
    else
      PartialPathCustomizer::Presenter.new(object, &partial_path_proc)
    end
  end

end
