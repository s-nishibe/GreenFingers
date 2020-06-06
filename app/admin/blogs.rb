ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :plant_id, :title, :body, :eyecatch_img_id, :weather, :temperature, :water, :status, :score, :tag_list

  # 入力フォーム
  form do |f|
    f.inputs do
      f.input :user
      f.input :plant
      f.input :title
      f.input :body
      f.input :weather, as: :select, collection: {'晴れ' => 0, '曇り' => 1, '雨' => 2, '雪' => 3}
      f.input :temperature
      f.input :water, as: :select, collection: {'あげた' => :true, 'あげてない' => :false}
      f.input :status, as: :select, collection: {'公開' => :true, '下書き' => :false}
    end
    f.actions
  end

  # 一覧画面
  index do
    selectable_column
    id_column
    column :user
    column :plant
    column :title
    column :score
    column 'comment' do |blog|
      blog.blog_comments.count
    end
    column :updated_at
    actions
  end

  # 詳細画面
  show do |blog|
    attributes_table(*blog.class.columns.collect { |column| column.name.to_sym })
    panel "コメント一覧" do
      table_for blog.blog_comments do
        column :user
        column :comment
      end
    end
    active_admin_comments
  end

end
