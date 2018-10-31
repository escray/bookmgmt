class Admin::StatesController < Admin::ApplicationController
  layout 'admin'
  def index
    @states = State.all
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:notice] = '新增状态成功'
      redirect_to admin_states_path
    else
      flash.now[:alert] = '新增状态未成功'
      render 'new'
    end
  end

  def make_default
    @state = State.find(params[:id])
    @state.make_default!

    flash[:notice] = "'#{@state.name}' 是默认状态"
    redirect_to admin_states_path
  end

  private

  def state_params
    params.require(:state).permit(:name, :color)
  end
end
