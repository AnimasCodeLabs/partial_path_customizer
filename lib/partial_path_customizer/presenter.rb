require 'dumb_delegator'

class PartialPathCustomizer::Presenter < DumbDelegator

  def self.wrap_collection collection, &partial_path_block
    collection.map do |obj|
      new obj, &partial_path_block
    end
  end

  def initialize(object, &partial_path_block)
    super(object)
    @partial_path_block = partial_path_block
  end

  def to_partial_path
    if @partial_path_block.present?
      @partial_path_block.call(_model_name)
    else
      __getobj__.to_partial_path
    end
  end

  def to_model
    self
  end

  private

  def _model_name
    __getobj__.class.model_name.singular
  end

end
