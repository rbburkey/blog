class StaticController < ApplicationController

def welcome
  @page = (params[:page] || 1).to_i
  offset = (@page -1) * 25
  @posts = Post.
              order(created_at: :desc).
              offset(offset).
              limit(25).
              all
end

end
