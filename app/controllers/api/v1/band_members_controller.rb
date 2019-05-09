class Api::V1::BandMembersController < ApplicationController
  def show
    render json: BandMember.find(params[:id])
  end
end
