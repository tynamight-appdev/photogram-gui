class UsersController < ApplicationController
  def index
    matching_users = User.all 

    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb"})
  end

  def details
    user_path = params.fetch("path_username")
    matching_users = User.where({ :username => user_path}) 
    @this_guy = matching_users.at(0)

    render({ :template => "user_templates/details.html.erb"})
  end

  def create
    desired_user = params.fetch("input_username")

    new_user = User.new
    new_user.username = desired_user
    
    new_user.save
    redirect_to("/users/"+ new_user.username)
  end 

  def update
    old_username = params.fetch("path_username")
    new_username = params.fetch("input_username")

    matching_user = User.where({ :id => old_username })
    the_user = matching_user.at(0)

    the_user.username = new_username
    the_user.save

    redirect_to("/users/"+ the_user.username)

  end
end