# app/admin/users_admin.rb
Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-users"
  end

  table do
    column :name
    column :email
    column :age
    column :tolerance
    actions
  end

  form do |user|
    text_field :name
    email_field :email
    number_field :age
    number_field :tolerance
    file_field :profile_img
  end
end
