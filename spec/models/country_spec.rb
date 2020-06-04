require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'relations' do
    it "has many preferences" do
      should respond_to(:preferences)
    end

    it "has many data covids" do
      should respond_to(:data_covids)
    end

    it "belongs to continent" do
      should respond_to(:continent)
    end
  end
end
