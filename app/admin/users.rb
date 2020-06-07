ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :introduction, :password, :profile_img_id, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :provider, :uid, :score

  # 入力フォーム
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :introduction
      f.input :password
    end
    f.actions
  end

  # 一覧画面
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :provider
    column 'blogs' do |user|
      user.blogs.count
    end
    column 'topics' do |user|
      user.topics.count
    end
    actions
  end

  # 詳細画面
  show do |user|
    attributes_table(*user.class.columns.collect { |column| column.name.to_sym })
    panel "日記一覧" do
      table_for user.blogs do
        column :title
        column :updated_at
      end
    end
    panel 'トピック一覧' do
      table_for user.topics do
        column :title
      end
    end
    active_admin_comments
  end


end
