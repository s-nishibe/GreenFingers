ActiveAdmin.register Topic do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :title, :eyecatch_img_id, :category, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :eyecatch_img_id, :category, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    # 入力フォーム
  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :category, as: :select, collection: {'育て方全般' => 0, '剪定' => 1, '土作り' => 2, '肥料' => 3, '病害虫' => 4, 'その他' => 5}
      f.input :status, as: :select, :collection: {'解決済み' => true, '未解決' => :false}
    end
    f.actions
  end

  # 一覧画面
  index do
    selectable_column
    id_column
    column :user
    column :title
    column :status
    column 'comments' do |topic|
      topic.topic_comments.count
    end
    actions
  end

  # 詳細画面
  show do |blog|
    attributes_table(*blog.class.columns.collect { |column| column.name.to_sym })
    panel "コメント一覧" do
      table_for topic.topic_comments do
        column :user
        column :comment
        column :updated_at
      end
    end
    active_admin_comments
  end

end
