class BandMembersController < ApplicationController
  def show
    @membership = BandMember.find_by(params[:musician_id])
  end

  def new
    @band_memeber = BandMember.new
  end

  def create
    binding.pry
    @band = Band.find(params[:band_id])
    @band_member = BandMember.create(band_id: params[:band_id], musician_id: params[:band_member][:musician_id])
    if @band_member.save
      flash[:notice] = "Musician successfully added to Band"
      redirect_to @band
    else
      flash[:notice] = "Musician NOT added. Sorry, try again."
    end
  end

end
