class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.order(created_at: :desc)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @projects = Project.all.order(created_at: :desc)
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
    @projects = Project.all.order(created_at: :desc)
    @task = @project.tasks.build
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project }
        format.json { render :show, status: :created, location: @project }        
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end 
      flash[:success] = "Project was created! You can #{make_undo_link} this action"      
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end 
      flash[:success] = "Project was updated! You can #{make_undo_link} this action"             
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end  
    flash[:success] = "Project was deleted! You can #{make_undo_link} this action"    
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description)
    end
end
