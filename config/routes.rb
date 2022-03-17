Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "details"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_photo", { :controller => "photos", :action => "details"})

  get("/delete_photo/:path_photo", { :controller => "photos", :action => "toast"})

  get("/insert_photo_record", { :controller => "photos", :action => "post"})

  get("/update_photo/:constant_id", { :controller => "photos", :action => "update"})

  get("/insert_comment_record", {:controller => "comments", :action => "react"})

  get("/insert_user_record", { :controller => "users", :action => "create"})

  get("/update_user/:path_username", {:controller => "users", :action => "update"})

end
