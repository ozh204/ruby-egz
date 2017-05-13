class WafflesController < ApplicationController
  before_action :set_waffle, only: [:show, :edit, :update, :destroy, :removeImage]

  def index
    @waffles = Waffle.where.not(discount:true)
    @wafflesPromo = Waffle.where(discount:true)
  end

  def new
    @waffle = Waffle.new
  end
  def create
    @waffle = Waffle.new(waffle_params)

    if @waffle.save
      redirect_to @waffle
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @waffle.update(waffle_params)
      redirect_to @waffle
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to waffles_path
  end

  def destroy_multiple
    Waffle.destroy(params[:waffles])

    redirect_to waffles_path
  end

  def removeImage
    @waffle.remove_image!
    @waffle.save
    redirect_to @waffle
  end

  private

  def set_waffle
    @waffle = Waffle.find(params[:id])
  end

  def waffle_params
    #params.require(:waffle).permit(:name, :price, :image)
    params.require(:waffle).permit(:name, :price, :image,:discount)
  end

end
