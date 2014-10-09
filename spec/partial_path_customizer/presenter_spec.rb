require 'rails_helper'

describe PartialPathCustomizer::Presenter do

  describe "delegations" do
    it "delegates undefined methods to object" do
      business = mock_model("Business", name: "Animas Code Labs")

      customizer = described_class.new business

      expect(customizer.name).to eq("Animas Code Labs")
    end
  end

  describe "#to_partial_path" do
    it "defaults to the default #to_partial_path" do
      business = mock_model("Business", name: "Fred", to_partial_path: "businesses/business")

      customizer = described_class.new business

      expect(customizer.to_partial_path).to eq(business.to_partial_path)
    end

    it "generates a partial_path based on the block passed in" do
      business_contact = mock_model("BusinessContact", name: "Fred", to_partial_path: "businesses/business")

      customizer = described_class.new business_contact do |model_name|
        "#{model_name}/hello"
      end

      expect(customizer.to_partial_path).to eq("business_contact/hello")
    end
  end

  describe "#to_model" do
    it "returns the customizer object with a working to_partial_path method" do
      dealer = Dealer.new
      customizer = described_class.new dealer do |model_name|
       "test"
      end

      expect(customizer.to_model.to_partial_path).to eq("test")
    end
  end

  describe ".wrap_collection" do
    it "wraps a collection" do
      business = mock_model("Business")
      business_contact = mock_model("BusinessContact")

      collection_to_wrap = [business, business_contact]

      wrapped_collection = described_class.wrap_collection collection_to_wrap do|model_name|
        "#{model_name.pluralize}/summary"
      end

      returned_partial_paths = wrapped_collection.collect(&:to_partial_path)
      expect(returned_partial_paths).to eq(["businesses/summary", "business_contacts/summary"])
    end
  end

  describe ".model_name" do
    it "delegates to the class of the source object" do
      dealer = Dealer.new

      customizer = described_class.new dealer

      expect(customizer.class.model_name).to eq(dealer.class.model_name)
    end
  end
end