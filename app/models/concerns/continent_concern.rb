module ContinentConcern
  extend ActiveSupport::Concern

  class_methods do
    def refactor_continent_name(name)
      case name
      when "australia/oceania"
        "Australia/Oceania"
      else
        name.titleize
      end
    end
  end

end