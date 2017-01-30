class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, on: [:show, :edit, :update, :destroy]
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index 
    @tasks = Task.all.order(created_at: :desc)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @projects = Project.all.order(created_at: :desc)
  end

  # POST /tasks
  # POST /tasks.json
  def create 
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @project }
        format.json { render :show, status: :created, location: @project }
        flash[:success] = "Task was created! You can undo this action"
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end     
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project }
        format.json { render :show, status: :ok, location: @project }
        flash[:success] = "Task was updated! You can undo this action"
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end 
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
 def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
      flash[:success] = "Task was deleted! You can undo this action"
    end   
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def find_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content, :date, :priority, :done)
    end
end
