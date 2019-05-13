class MusicianSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :scene, :home_town, :bio, :musician_state, :instruments, :user_id

  def user_id
    if current_user
      current_user.id
    end
  end

end
