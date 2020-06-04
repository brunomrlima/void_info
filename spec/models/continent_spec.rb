require 'rails_helper'

RSpec.describe Continent, type: :model do
  context 'relations' do
    it "has many countries" do
      should respond_to(:countries)
    end

    it "has many data covids" do
      should respond_to(:data_covids)
    end
  end
end
