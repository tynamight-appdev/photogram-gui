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
end