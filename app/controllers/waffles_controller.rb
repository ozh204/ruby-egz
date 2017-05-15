class WafflesController < ApplicationController
  before_action :set_waffle, only: [:show, :edit, :update, :destroy, :removeImage]
  load_and_authorize_resource

  def index
    waffles = Waffle.where.not(discount:true)
    wafflesPromo = Waffle.where(discount:true)

    @wafflesArr = Array.new
    @wafflesArrCount = 0
    waffles.each do |w|
      @wafflesArr << w
      @wafflesArrCount+=1
    end

    @wafflesPromoArr = Array.new
    @wafflesPromoCount = 0
    wafflesPromo.each do |w|
      @wafflesPromoArr << w
      @wafflesPromoCount+=1
    end


  end

  def new
    # authorize! :create, Waffle
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
    Waffle.destroy(params[:id])

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
    params.require(:waffle).permit(:name, :price, :image, :discount)
  end

end
