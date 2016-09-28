class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    if ( params[:name] or params[:building] or params[:size])
      @rooms = Room.search(params[:name],params[:building],params[:size])
    else
      @recipes = Room.all.order("created_at DESC")
    end

  end

  def new
    @room = Room.new
  end





  def show
    @room = Room.find(params[:id])

  end



  def create
    @room = Room.create(room_params)
    if @room.save
      name = @room.name
      building=@room.building
      size=@room.size
      redirect_to rooms_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create room. Please try again"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update room_params
    if @room.save
      flash[:notice] = "Your room was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def room_params
      params.require(:room).permit(:name,:building,:size,:status, :delete)
    end

end
