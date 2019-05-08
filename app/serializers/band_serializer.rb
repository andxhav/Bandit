class BandSerializer < ActiveModel::Serializer
  attributes :id, :band_name, :scene, :genre

  def user_id
    if current_user
      current_user.id
    end
  end

end
