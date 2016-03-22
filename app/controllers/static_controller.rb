class StaticController < ApplicationController

def welcome
  @posts = Post.all
end

end
