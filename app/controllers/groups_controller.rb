class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    Group.new.save

    redirect_to root_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to root_path, status: 303
  end
end
