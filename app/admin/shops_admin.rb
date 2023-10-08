# app/admin/shops_admin.rb
Trestle.resource(:shops) do
  menu do
    item :shops, icon: "fa fa-store"
  end

  table do
    column :name
    column :prefecture
    column :business_hour
    column :closed
    actions
  end

  form do |shop|
    text_field :name
    select :prefecture, Shop.prefectures.keys.map { |pref| [pref.humanize, pref] }
    text_field :business_hour
    text_field :closed
    file_field :shop_img
  end
end
