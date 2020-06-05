ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :plant_id, :title, :body, :eyecatch_img_id, :weather, :temperature, :water, :status, :score, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :plant_id, :title, :body, :eyecatch_img_id, :weather, :temperature, :water, :status, :score, :tag_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
