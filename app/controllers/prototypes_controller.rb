class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]


  def index # indexアクションを定義した
    @prototypes = Prototype.all.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

def edit
  @prototype = Prototype.find(params[:id])
 end

 def update
  @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.new(prototype_params)
    prototype.destroy
    redirect_to root_path
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      Rails.logger.debug "Prototype save errors: #{@prototype.errors.full_messages}"
      render :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end 

  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end
end
