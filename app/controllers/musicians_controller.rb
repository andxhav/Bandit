class MusiciansController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @musicians = Musician.all
    @user = current_user
  end

  def show
    @musician = Musician.find(params[:id])
  end

  private

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :scene, :home_town)
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You need to be signed in to create a musician profile."
      redirect_to '/users/sign_in'
    end
  end

end
