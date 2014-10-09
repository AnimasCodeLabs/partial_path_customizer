require 'partial_path_customizer/presenter'

module PartialPathCustomizer::PartialPathHelper

  def customize_partial_path object, partial_name_or_callable
    partial_path_callable = proc{|model| "#{model.class.model_name.plural}/#{partial_name_or_callable}" }

    if partial_name_or_callable.respond_to?(:call)
      partial_path_callable = partial_name_or_callable
    end

    if object.respond_to?(:map)
      PartialPathCustomizer::Presenter.wrap_collection(object, &partial_path_callable)
    else
      PartialPathCustomizer::Presenter.new(object, &partial_path_callable)
    end
  end

end
