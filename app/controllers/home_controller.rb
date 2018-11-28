class HomeController < ApplicationController
  
  def index
  	@category = Category.all
  	@posts = Post.all
  end

end
