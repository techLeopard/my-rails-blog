class UlinksController < ApplicationController
  def index
    @ulinks = Ulink.all
  end

  def show
    @ulink = Ulink.find(params[:id])
  end


  def new
    @ulink = Ulink.new
  end

  def create
    @ulink = Ulink.new(ulink_params)

    if @ulink.save
      redirect_to @ulink
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @ulink = Ulink.find(params[:id])
  end

  def update
    @ulink = Ulink.find(params[:id])

    if @ulink.update(ulink_params)
      redirect_to @ulink
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @ulink = Ulink.find(params[:id])
    @ulink.destroy
    
    redirect_to ulinks_path, status: :see_other
  end


  private
  def ulink_params
    params.require(:ulink).permit(:title, :body)
  end

end