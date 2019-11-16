class TodosController < BaseController
  def index
    @todos = Todo.where(user_id: current_user.id)
  end

  def show
    @todo = Todo.where(user_id: current_user.id).find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id

    if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  def edit
    @todo = Todo.where(user_id: current_user.id).find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.user_id = current_user.id
   
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.where(user_id: current_user.id).find(params[:id])
    @todo.destroy

    redirect_to todos_path
  end

  def ascompleted
    @todo = Todo.where(user_id: current_user.id).find(params[:id])
    @todo.is_completed = params[:status]
    @todo.completed_at = DateTime.now.to_date
    @todo.save

    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description, :due_date, :priority, :user_id)
    end
end
