class MentionsController < ApplicationController
  def index
    # TO-DO filter @user using a search charsacter params or they'll be too many
    @users = User.all

    respond_to do |format|
      format.json
    end
  end
end
