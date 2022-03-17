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


end