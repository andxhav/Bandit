class Api::V1::MusiciansController < ApplicationController
  def show
    render json: Musician.find(params[:id])
  end

  def create
    musician = Musician.find(params[:musician_id])
    if musician
      musician.update(musician_state: params[:musician_state])
    end
  end

end
