ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :image_url, :price]
  # end

  index do
    column :id
    column :email
    column :admin
    column :current_sign_in_at
    column :last_sign_in_at
    column :last_sign_in_ip
    column :created_at
  end

end
