# frozen_string_literal: true

module Community
  class PostsController < BaseController
    before_action :build_node
    before_action :verify_node, only: [:new]

    def new
      @post = @node.build_post
      respond_to do |format|
        format.json { render 'community/posts/new.js.erb' }
      end
    end

    def create
      @post = @node.build_post(post_params)
      @post.save
      if @post.auto_publish
        Resque.enqueue_at(@post.publish_at, PublishOnFacebookJob, post)
      end
      respond_to do |format|
        format.js { render 'community/posts/create.js' }
      end
    end

    def edit
      @post = Post.find(params[:id])
      respond_to do |format|
        format.json { render 'community/posts/edit.js.erb' }
      end
    end

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      respond_to do |format|
        format.js { render 'community/posts/update.js' }
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      respond_to do |format|
        format.js { render 'community/posts/delete.js' }
      end
    end

    private

    def build_node
      @node = Node.find(params[:node_id])
    end

    def verify_node
      redirect_to action: :edit, id: @node.post, format: :json if @node.post
    end

    def post_params
      params.require(:post).permit(:title, :coworker_id,
                                   :publish_at, :auto_publish,
                                   :content_status)
            .merge(user: current_user)
    end
  end
end
