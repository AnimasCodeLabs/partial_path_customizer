require 'rails_helper'

describe PartialPathCustomizer::PartialPathHelper, ".customize_partial_path" do
  context "with a single object" do
    it "returns an object whose #to_partial_path returns <model_name pluralized>/<partial_name>" do
      seller = Dealer.new

      wrapped_obj = helper.customize_partial_path seller, "seller_price_box_info"

      expect(wrapped_obj.to_partial_path).to eq("dealers/seller_price_box_info")
    end
  end

  context "with a collection" do
    it "returns collection of objects whose #to_partial_path returns <model_name pluralized>/<partial_name>" do
      dealer = Dealer.new
      bike = mock_model "Bike"
      brand = mock_model "Brand"

      collection = [dealer, bike, brand]

      wrapped_collection = helper.customize_partial_path collection, "tile"

      partial_paths = wrapped_collection.collect(&:to_partial_path)

      expect(partial_paths).to eq(["dealers/tile", "bikes/tile", "brands/tile"])
    end
  end
end
