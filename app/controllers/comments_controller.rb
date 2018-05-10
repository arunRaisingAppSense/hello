class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @comment = @commentable.comments.new comment_params
        @comment.save
            redirect_to @commentable, notice: "Your comment was successfully posted."

    end

    def destroy
        #byebug
        @comment = Comment.find(params[:id])
        #byebug
        @type =  @comment.commentable_type
        @common_obj = @type == "Actor" ? Actor.find(@comment.commentable_id) : Film.find(@comment.commentable_id)
        @comment.destroy
        respond_to do |format|
            @type == "Actor" ? format.html { redirect_to actor_path(@common_obj), notice: 'Comment was successfully removed.' } : format.html { redirect_to film_path(@common_obj), notice: 'Comment was successfully removed.' }
        end

        #redirect_back(fallback_location: actor_path)
    end

    private

        def comment_params
            params.require(:comment).permit(:body)
        end
end
