class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:book).permit(:name, :introduction, :profile_image)
  end
end
