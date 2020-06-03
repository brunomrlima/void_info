class Api::V1::CountriesController < ApplicationController

  def index
    @countries = Country.filter_data(get_filter_params)
    render json: @countries.map(&:to_h), status: :ok
  end

  private

    def get_filter_params
      params.permit(:name)
    end

end