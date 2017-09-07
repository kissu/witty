ActiveAdmin.register User do
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
    column :first_name
    column :last_name
    column :company
    column :email
    column :role
    column :current_sign_in_at
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Mettre à jour ses informations" do
      f.input :first_name
      f.input :last_name
      f.input :company
    end
    f.inputs "Mettre à jour sa carte" do
      f.input :title
      f.input :description
    end
    f.inputs "Changer ses droits" do
      f.input :role
    end
    f.actions
  end

end
