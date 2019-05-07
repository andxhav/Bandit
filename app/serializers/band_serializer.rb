class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :scene, :genre, :user_id

  has_many :musicians

  def user_id
    if current_user
      current_user.id
    end
  end

end
