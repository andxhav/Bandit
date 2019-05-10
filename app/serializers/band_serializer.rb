class BandSerializer < ActiveModel::Serializer
  attributes :id, :band_name, :scene, :genre, :bio

  def user_id
    if current_user
      current_user.id
    end
  end

end
