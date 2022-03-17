class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all 

    @list_of_photos = matching_photos
    render({ :template => "photo_templates/index.html.erb"})
  end

  def details
    photo_path = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => photo_path}).order({ :created_at => :desc })
    @post = matching_photos.at(0)

    @list_of_comments = Comment.where({:id => @post.id})

    render({ :template => "photo_templates/details.html.erb"})
  end

  def toast
    the_id = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    #render({ :template => "photo_templates/toast.html.erb"})
    redirect_to("/photos")
  end

  def post
    user_input = params.fetch("input_image")
    user_caption = params.fetch("input_caption")
    user_owner = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = user_input
    a_new_photo.caption = user_caption
    a_new_photo.owner_id = user_owner

    a_new_photo.save

    redirect_to("/photos/"+ a_new_photo.id.to_s)
  end

  def update
    updated_image = params.fetch("input_image")
    updated_cap = params.fetch("input_caption")
    constant_id = params.fetch("constant_id")

    matching_photos = Photo.where({ :id => constant_id})
    the_photo = matching_photos.at(0)

    the_photo.image = updated_image
    the_photo.caption = updated_cap
    the_photo.save

   redirect_to("/photos/"+ the_photo.id.to_s)
  end

end

  
