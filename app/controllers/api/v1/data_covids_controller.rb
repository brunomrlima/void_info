class Api::V1::DataCovidsController < ApplicationController

  def index
    @data_covids = DataCovid.filter_data(get_filter_params)
    render json: @data_covids.map(&:to_h), status: :ok
  end

  private

    def get_filter_params
      params.permit(:country, :continent, :dates)
    end

end