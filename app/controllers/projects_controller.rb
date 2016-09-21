class ProjectsController < ApplicationController


  def index
    redirect_to root_url
  end

  def timeline
    @project = Project.find Project.decrypt(params[:id])
  end

  def show
    @project = Project.find Project.decrypt(params[:id])
  end

  def new
    @project = current_user.projects.new
    if !@project
      redirect_to root_url
    end

  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    current_user
    @project = Project.find(params[:id])
  end

  def update
    current_user
    @project = Project.find Project.decrypt(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    current_user
    @project = Project.find Project.decrypt(params[:id])
    if @current_user == @project.user
      @project.destroy
      redirect_to user_path(@current_user)
    else
      redirect_to root_url
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :last_update)
  end

end
