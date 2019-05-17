class GigsController < ApplicationController

  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
    @band = Band.find(params[:band_id])
  end

  def create
    @gig = Gig.new(gig_params)

    if @gig.save
      flash[:notice] = "Gig Created Successfully!"
      redirect_to '/gigs/'
    else
      flash[:error] = @gig.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def gig_params
    params.require(:gig).permit(:address, :gig_lat, :gig_long, :bio, :gig_photo, :date, :band_id)
  end


end
