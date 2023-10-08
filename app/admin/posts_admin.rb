# app/admin/posts_admin.rb
Trestle.resource(:posts) do
  menu do
    item :posts, icon: "fa fa-pencil-alt"
  end

  table do
    column :title
    column :spiciness
    column :user, link: true
    column :shop, link: true
    actions
  end

  form do |post|
    text_field :title
    number_field :spiciness
    select :user_id, User.all.map { |user| [user.name, user.id] }
    select :shop_id, Shop.all.map { |shop| [shop.name, shop.id] }
    file_field :curry_img
  end
end
