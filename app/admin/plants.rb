ActiveAdmin.register Plant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :name, :kind, :memo

  # 入力フォーム
  form do |f|
    f.inputs do
      f.input :user
      f.input :name
      f.input :kind, as: :select, collection: {'一年草' => 0, '多年草' => 1, '低木' => 2, '高木' => 3}
      f.input :memo
    end
    f.actions
  end

  # 一覧画面
  index do
    selectable_column
    id_column
    column :user
    column :name
    column :kind
    column :memo
    actions
  end

  # 詳細画面
  show do |blog|
    attributes_table(*blog.class.columns.collect { |column| column.name.to_sym })
    panel "日記一覧" do
      table_for plant.blogs do
        column :title
        column :score
        column 'comments' do |blog|
          blog.blog_comments.count
        end
        column 'stamps' do |blog|
          blog.stamps.count
        end
        column :updated_at
      end
    end
    active_admin_comments
  end

end
