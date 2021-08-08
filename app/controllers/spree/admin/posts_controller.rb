module Spree
  module Admin
    class Spree::Admin::PostsController < Spree::Admin::BaseController

      def index
        curr_page = params[:page] || 1
        @posts = Spree::Post.all.order("updated_at DESC").page(curr_page).per(15)
      end

      def show
        @post = Spree::Post.find(params[:id])
      end

      def new
        @post = Spree::Post.new
      end

      def edit
        @post = Spree::Post.find(params[:id])
      end

      def create
        @post = Spree::Post.new(post_params)

        respond_to do |format|
          if @post.save
            if !params[:video].nil?
              @post.video.attach(params[:video])
            end
            format.html { redirect_to spree.admin_post_path(@post.id) }
            format.js
          else
            format.html { render template: "new"}
          end
      end
    end

    def create_ru_form
      @id = params.permit!.to_h[:id]
      render "spree/admin/posts/create_ru_form", locals: {id: @id}
    end

    def create_ru
      @post_translate = Spree::Post::Translation.new(spree_post_id: params[:id],title: params[:title], body: params[:body], locale: :ru)

      respond_to do |format|
        if @post_translate.save!
          if Spree::Post::Translation.where(spree_post_id: params[:id], locale: :ru).count > 1
            Spree::Post::Translation.where(spree_post_id: params[:id], locale: :ru).first.delete
          end
          format.html { redirect_to spree.admin_post_path(params[:id]) }
          format.js { render partial: "show_ru.js"}
        else
          format.html { render template: "new"}
        end
    end
    end

      def update
        @post = Spree::Post.find(params[:id])

        respond_to do |format|
          if @post.update(post_params)
            if !params[:video].nil?
              @post.video.attach(params[:video])
            end
            format.html { redirect_to spree.admin_post_path(@post.id) }
            format.js
          else
            format.html { render template: "new"}
          end
      end
      end

      def destroy
        @post = Spree::Post.find(params[:id])
        @post.destroy

        redirect_to admin_posts_path
      end

      def destroy_video
        @post = Spree::Post.find(params[:id])
        @post.video.purge
        redirect_back(fallback_location: edit_admin_post_url(@post.id), notice: Spree.t(:delete))
      end

      private
      def post_params
        params.require(:post).permit(:id, :title, :body, :video)
    end
  end
end
end
