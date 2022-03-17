Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "details"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_photo", { :controller => "photos", :action => "details"})

  get("/delete_photo/:path_photo", { :controller => "photos", :action => "toast"})

  get("/insert_photo_record", { :controller => "photos", :action => "post"})

  get("/update_photo/:constant_id", { :controller => "photos", :action => "update"})

end
