class CommentsController < ApplicationController
  def react
    a_photo_id = params.fetch("input_photo_id")
    a_author_id = params.fetch("input_author_id")
    a_comment_body = params.fetch("input_body")

    new_comment = Comment.new
    new_comment.photo_id = a_photo_id
    new_comment.author_id = a_author_id
    new_comment.body = a_comment_body

    new_comment.save

    redirect_to("/photos/" + a_photo_id.to_s)

  end
end
