class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		book = Book.find(params[:book_id])
		book_new = Book.new
		comment = current_user.book_comments.new(book_comment_params)
		comment.user_id = current_user.id
		if comment.save
			flash[:success] = "Comment was successfully created."
		else
			book_comments = BookComment.where(:id book)
		end
	end

  def destroy
    comment = BookComment.find(params[:id])
		comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
