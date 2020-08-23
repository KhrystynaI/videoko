module Spree
  class PostsController < Spree::StoreController
    def index
      @posts = Spree::Post.all.order("updated_at DESC").page(params[:page])
    end

    def show
      @post = Spree::Post.find(params[:id])
    end
end
end