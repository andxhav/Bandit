class Api::V1::MusiciansController < ApplicationController
  def show
    render json: Musician.find(params[:id])
  end
end
