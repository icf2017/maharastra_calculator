require 'minitest/autorun'

require_relative '../../application'
require_relative '../test_helper'

describe Model do
  before do
    @model = ModelResult.new
  end

  describe "Test ModelResult" do

    it "instance method calculate_pathway respond with hash" do
      assert @model.calculate_pathway('22202222222222220222222222012222202222222211202220222022222').is_a?(Hash)
    end

    it "class method calculate_pathway respond with hash" do
      assert ModelResult.calculate_pathway('22202222222222220222222222012222202222222211202220222022222').is_a?(Hash)
    end
  end
end