class MusiciansController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @musicians = Musician.all
    @user = current_user
  end

  def show
    @musician = Musician.find(params[:id])
    @user = current_user
  end

  def new
    @musician = Musician.new
  end

  def create
    @user = current_user
    @musician = Musician.new(musician_params)
    @musician.user = @user

    if @musician.save
      flash[:notice] = "Musician Profile Created Successfully!"
      redirect_to @musician
    else
      flash[:error] = @musician.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :scene, :home_town, :email, :bio, :instruments, :user)
  end

  protected

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You need to be signed in to create a musician profile."
      redirect_to '/users/sign_in'
    end
  end

end
