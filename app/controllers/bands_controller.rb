class BandsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    binding.pry
    @bands = Band.all
    @user = current_user
  end

  def show
    @band = Band.find(params[:id])
    @musicians = @band.musicians
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "Band successfully created."
      redirect_to @band
    else
      render action: 'new'
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :scene, :genre)
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You need to be signed in to start a band."
      redirect_to '/users/sign_in'
    end
  end

end
