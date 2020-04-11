class DraftsController < ApplicationController
  before_action :set_user

  def new
    @draft = Draft.new
  end

  def preview
    if params[:id]
      @draft = Draft.find(params[:id])
      @draft.eyecatch_img = params[:draft][:eyecatch_img]
      @draft.title = params[:draft][:title]
      @draft.tag_list = params[:draft][:tag_list]
      @draft.content = params[:draft][:content]
    else
      @draft = Draft.new
      @draft.eyecatch_img = params[:draft][:eyecatch_img]
      @draft.title = params[:draft][:title]
      @draft.tag_list = params[:draft][:tag_list]
      @draft.content = params[:draft][:content]
    end
  end

  def create
    if params[:preview_btn]
      @draft = Draft.new(save_params)
      @draft.eyecatch_img = params[:draft][:eyecatch_img]
      @draft.title = params[:draft][:title]
      @draft.tag_list = params[:draft][:tag_list]
      @draft.content = params[:draft][:content]
      render :preview
    elsif params[:draft_btn]
      @draft = current_user.drafts.build(save_params)
      @draft.eyecatch_img = params[:draft][:eyecatch_img]
      @draft.title = params[:draft][:title]
      @draft.tag_list = params[:draft][:tag_list]
      @draft.content = params[:draft][:content]
      if @draft.save
         redirect_to drafts_path
         flash[:success] = '記事は下書きに保存されました！'
      else
         render :preview, danger: '記事が保存できません。タイトルや本文の文字数は適切ですか？'
      end
    elsif params[:blog_btn]
      @blog = current_user.blogs.build(save_params)
      @blog.eyecatch_img = params[:draft][:eyecatch_img]
      @blog.title = params[:draft][:title]
      @blog.tag_list = params[:draft][:tag_list]
      @blog.content = params[:draft][:content]
      if @blog.save
         redirect_to blog_path(@blog)
         flash[:success] = 'ブログが公開されました！'
      else
         render :preview, danger: '記事が保存できません。タイトルや本文の文字数は適切ですか？'
      end
    end
  end

  def index
    @drafts = @user.drafts
  end

  def edit
    @draft = Draft.find(params[:id])
  end

  def update
    if params[:draft_btn]
      @draft = Draft.find(params[:id])
      @draft.user_id = current_user.id
      @draft.eyecatch_img = params[:draft][:eyecatch_img]
      @draft.title = params[:draft][:title]
      @draft.tag_list = params[:draft][:tag_list]
      @draft.content = params[:draft][:content]
      if @draft.save
         redirect_to drafts_path
         flash[:success] = '下書きが更新されました！'
      else
         render :preview
         flash[:danger] = '記事が保存できません。タイトルや本文の文字数は適切ですか？'
      end
    elsif params[:blog_btn]
      @blog = current_user.blogs.build(save_params)
      @blog.eyecatch_img = params[:draft][:eyecatch_img]
      @blog.title = params[:draft][:title]
      @blog.tag_list = params[:draft][:tag_list]
      @blog.content = params[:draft][:content]
      if @blog.save
         redirect_to blog_path(@blog)
         flash[:success] = 'ブログが公開されました！'
      else
         render :preview
         flash[:danger] = '記事が保存できません。タイトルや本文の文字数は適切ですか？'
      end
    end
  end

  def destroy
    @draft = Draft.find(params[:id])
    @draft.destroy
    redirect_to drafts_path
    flash[:info] = '下書きを削除しました。'
  end

  private
  def set_user
    @user = current_user
  end

  def save_params
    params.permit(:user_id, :title, :content, :eyecatch_img, :tag_list)
  end
end
