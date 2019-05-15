class BandSerializer < ActiveModel::Serializer
  attributes :id, :band_name, :scene, :genre, :bio, :band_photo

  def user_id
    if current_user
      current_user.id
    end
  end

end
