class BandsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @bands = Band.all
    @user = current_user
  end

  def show
    @band = Band.find(params[:id])
    @user = current_user
    @band_member = BandMember.create
  end

  def new
    @band = Band.new
    @user = current_user
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "Band successfully created."
      @band_member = BandMember.create(band_id: @band.id, musician_id: Musician.find_by(user_id: current_user.id).id)


    else
      render action: 'new'
    end
  end

  def update
    @band = Band.update(params[:id], bandcamp_params)
    redirect_to @band
  end

  private

  def band_params
    params.require(:band).permit(:band_name, :scene, :genre, :bio)
  end

  def bandcamp_params
    params.require(:band).permit(:bandcamp_embedded)
  end

  protected

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You need to be signed in to start a band."
      redirect_to '/users/sign_in'
    end
  end

end
