class GroupsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @groups = Group.where(user: current_user).includes(:entity_groups).order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      flash[:notice] = 'Group successfully created!'
      redirect_to root_path(current_user)
    else
      flash.now[:error] = 'Error: Error occurred when creating post'
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def show
    @group = Group.find(params[:id])
    @group_entity = EntityGroup.includes(:entity).where(group: @group).order(created_at: :desc)
    @total = 0
    @group_entity.each {|amount| @total += amount.entity.amount}
  end
end