class Api::V1::ContinentsController < ApplicationController

  def index
    @continents = Continent.filter_data(get_filter_params)
    render json: @continents.map(&:to_h), status: :ok
  end

  private

    def get_filter_params
      params.permit(:name)
    end

end