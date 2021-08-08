module Spree
  class PostsController < Spree::StoreController
    def index
      curr_page = params[:page] || 1
      @posts = Spree::Post.all.order("updated_at DESC").page(curr_page).per(5)
    end

    def show
      @post = Spree::Post.find(params[:id])
    end
end
end
