class MusicianSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :scene, :home_town

  def user_id
    if current_user
      current_user.id
    end
  end

end
