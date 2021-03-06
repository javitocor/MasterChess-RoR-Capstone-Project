module ApplicationHelper
  # rubocop:disable  Layout/LineLength
  def full_title(page_title = '')
    base_title = 'Masterchess'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def like_or_dislike_btn(gambit)
    like = Like.find_by(gambit: gambit, user: current_user)
    if like
      link_to('Dislike!', gambit_like_path(id: like.id, gambit_id: gambit.id), method: :delete)
    else
      link_to('Like!', gambit_likes_path(gambit_id: gambit.id), method: :post)
    end
  end

  def follow_or_unfollow_btn(user)
    follow = Following.find_by(followed: user, follower: current_user)
    if follow
      link_to('Unfollow!', user_following_path(id: follow.id, followed_id: user.id, user_id: user.id), method: :delete)
    else
      link_to('Follow!', user_followings_path(follower_id: current_user.id, followed_id: user.id, user_id: current_user.id), method: :post)
    end
  end
end
# rubocop:enable  Layout/LineLength
