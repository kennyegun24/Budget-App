class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @groups = Group.where(user: current_user)
    @group_array = []
    @group = Group.find(params[:group_id])
    @group_array << @group
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.new(entities_params)
    @entity.user = current_user

    if @entity.save
      @group_entity = EntityGroup.create(entity: @entity, group_id: params[:group])
      flash[:notice] = 'Group successfully created!'
      redirect_to group_path(id: params[:group_id])
    else
      flash.now[:error] = 'Error: Error occurred when creating post'
      render :new
    end
  end

  def entities_params
    params.require(:entity).permit(:name, :amount, :group)
  end
end
