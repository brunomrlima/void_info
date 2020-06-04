require 'rails_helper'

RSpec.describe DataCovid, type: :model do
  context 'relations' do
    it "belongs to countries" do
      should respond_to(:country)
    end
  end
end
