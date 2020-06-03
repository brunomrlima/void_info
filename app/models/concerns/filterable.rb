module Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filter_data(attributes)
      results = self.where(nil)
      attributes.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end

end