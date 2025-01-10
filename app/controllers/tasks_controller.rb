class TasksController < ApplicationController
    # Show all tasks
    def index
      @tasks = Task.all
    end
  
    # Show a single task
    def show
      @task = Task.find(params[:id])
    end
  
    # Show the form to create a new task
    def new
      @task = Task.new
    end
  
    # Create a new task
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end
  
    # Show the form to edit a task
    def edit
      @task = Task.find(params[:id])
    end
  
    # Update an existing task
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    # Destroy a task
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    end
  
    private
      # Only allow a trusted parameter "white list" through.
      def task_params
        params.require(:task).permit(:title, :description, :status)
      end
  end
  