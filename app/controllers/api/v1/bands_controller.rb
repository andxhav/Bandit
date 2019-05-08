class Api::V1::BandsController < ApplicationController
  def show
    render json: Band.find(params[:id])
  end
end
