class BandsController < ApplicationController
  def show
    @membership = BandMember.find_by(params[:musician_id])
  end

  def new
    @band_memeber = BandMember.new
  end

  def create
    @band_member = BandMember.create(band_member_params)
  end

end
