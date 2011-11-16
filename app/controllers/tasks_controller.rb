class TasksController < ApplicationController
  def index
    # @tasks => not completed
    # if cookies[:sort_by] == "due"
    #   @current_tasks = Task.find_by_sql "SELECT * FROM tasks WHERE is_completed IS NULL ORDER BY due"
    # else
      @current_tasks = Task.find_by_sql "SELECT * FROM tasks WHERE is_completed IS NULL"
    # end
    @task = Task.new()
    respond_to do |format|
      format.html
      format.js
      format.xml 
    end
  end
  
  def completed
    # @tasks => not completed
    @completed_tasks = Task.where(:is_completed => true)
    #@task = Task.new() # still needed for the form
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end

  end

  def create
    @task = Task.create(params[:task])
    @task.due = Date.strptime(params[:task][:due], "%m/%d/%Y")
    @task.save!
    #flash[:notice] = "Task added."
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  # PUT complete_task_path(:id)
  def complete
    @task = Task.find(params[:id])
    @task.is_completed = true
    @task.save!
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def sort_by_due
    cookies[:sort_by] = "due"
    @current_tasks = Task.find_by_sql "SELECT * FROM tasks WHERE is_completed IS NULL ORDER BY due"
    respond_to do |format|
      format.js
    end
  end
  
  def sort_by_date_added
    cookies[:sort_by] = "date_added"
    @current_tasks = Task.find_by_sql "SELECT * FROM tasks WHERE is_completed IS NULL"
    respond_to do |format|
      format.js
    end
  end
end
