ActiveAdmin.register Article do
  permit_params :title, :description, :url
end
