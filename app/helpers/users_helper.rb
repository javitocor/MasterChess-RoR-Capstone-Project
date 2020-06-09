module UsersHelper  

  def display_avatar(user_id)
    user = User.find(user_id)
    user.avatar.attached? ? image_tag(user.avatar, class:'rounded-circle card-img-top circle', size: "45x48") : image_tag('avatar_default.jpg', class:'rounded-circle card-img-top circle', size: "45x48")
  end

  def display_cover(user_id)
    user = User.find(user_id)
    user.cover_photo.attached? ? image_tag(user.cover_photo, size: "695x300") : image_tag('cover_default.jpg', size: "695x300")
  end  
end
