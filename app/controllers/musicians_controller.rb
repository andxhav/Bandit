class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
    @user = current_user
  end

end
