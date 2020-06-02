module ApplicationHelper
    def full_title(page_title='')
        base_title = "Masterchess"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
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
end
