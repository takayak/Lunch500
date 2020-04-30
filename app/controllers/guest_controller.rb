class GuestController < ApplicationController

  def create
    @user = User.find_by(email: 'guest@guest')
    if @user == nil
      flash[:notice] = 'ゲスト購入ユーザーが作成されていません。'
      redirect_to posts_path
    else
      sign_in(:user, @user)
      flash[:notice] = 'ゲスト購入ユーザーでログインしました'
      redirect_to posts_path
    end
  end

  def create2
    @user = User.find_by(email: 'test@test2')
    if @user == nil
      flash[:notice] = 'ゲスト購入ユーザーが作成されていません。'
      redirect_to posts_path
    else
      sign_in(:user, @user)
      flash[:notice] = 'ゲスト購入ユーザーでログインしました'
      redirect_to posts_path
    end
  end
end
