class SearchesController < ApplicationController
    before_action :authenticate_user!
    def search 
        if params[:search].blank?
            redirect_to root_path, notice: 'Write something to start the search'
        else
            @results = Gambit.joins(:user).search(params[:search])
        end
    end
end
