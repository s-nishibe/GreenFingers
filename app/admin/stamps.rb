ActiveAdmin.register Stamp do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :blog_id, :stamp_img

  # 入力フォーム
  form do |f|
    f.inputs do
      f.input :user
      f.input :blog
      f.input :stamp_img, as: :select, collection: {'いいね' => 1, 'なるほど' => 2, 'おもしろい' => 3, 'スター' => 4, 'ありがとう' => 5}
    end
    f.actions
  end

end
