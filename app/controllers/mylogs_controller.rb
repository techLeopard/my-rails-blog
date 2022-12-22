class MylogsController < ApplicationController
  def index
    @mylogs = Mylog.all
  end

  def show
    @mylog = Mylog.find(params[:id])
  end

  def new
    @mylog = Mylog.new
  end


  def create
    @mylog = Mylog.new(mylog_params)

    if @mylog.save
      redirect_to @mylog
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mylog = Mylog.find(params[:id])
  end

  def update
    @mylog = Mylog.find(params[:id])

    if @mylog.update(mylog_params)
      redirect_to @mylog
    else
      render :new, status: :unprocessable_entity
    end
  end

private
def mylog_params
  params.require(:mylog).permit(:title, :body)
end

end
