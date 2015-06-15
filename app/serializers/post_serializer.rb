class PostSerializer < ActiveModel::Serializer
  attributes :id, 
    :user_id,
    :media
    :text,
    :scheduled_date


  def media
    return "Coming soon"
  end
end