class CommentsController < ApplicationController
 
  def new
   @comment = Comment.new(topic_id: params[:topic_id])
  end
 
  def create
   
   @comment = Comment.new(body: comment_params[:body], topic_id: params[:topic_id], user_id: current_user.id)
   if @comment.save
     redirect_to topics_path, success: 'コメントを登録しました'
   else
     redirect_to topics_path, danger: 'コメントの登録に失敗しました'
   end 
  end 
  
  private
   def comment_params
     params.require(:comment).permit(:body)
   end
end
