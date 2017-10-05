ActiveAdmin.register User do
  config.sort_order = 'current_sign_in_at_desc'

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :first_name, :last_name, :email,
    :company, :role, :title, :description

  index do
    selectable_column
    column :id
    column :email
    column "Last connection", :current_sign_in_at
    column :sign_in_count
    column :role
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Edit user" do
      f.input :email
      f.input :role
    end
    f.actions
  end

end
