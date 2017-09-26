ActiveAdmin.register Article do
  permit_params :title, :description, :url, tag_attributes: [:name]
  permit_params do
    params = [:title, :description, :publisher_id]
    params.push :author_id if current_user.super_admin?
    params
  end
end
