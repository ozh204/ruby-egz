class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    order_waffle = OrderWaffle.where("order_id = #{@order.id}").pluck("waffle_id").join(',')
    if !order_waffle.blank?
      @waffles = Waffle.where("id IN (#{order_waffle})")
    end
  end

  def new
    @order = Order.new
    # @waffles = Waffle.all? { |  }
    @waffles = Waffle.where.not(discount:true).in_groups_of(4)
    @wafflesPromo = Waffle.where(discount:true)

  end
  def create
    @order = Order.new
    @order.date = Time.now
    price = 0

    params[:selected_waffles].each { |id, quantity|
      if quantity[0].to_i == 0
        next
      end
      @order_waffle = OrderWaffle.new
      @order_waffle.order = @order
      @order_waffle.waffle = Waffle.find(id)
      @order_waffle.quantity = quantity[0]
      @order_waffle.save

      price += quantity[0].to_i * Waffle.find(id).price
    }

    @order.price = price
    @order.shop_id =  params[:order][:shop_id]

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @waffles = Waffle.all
  end
  def update
    OrderWaffle.destroy_all(order_id: @order.id)
    price = 0
    params[:selected_waffles].each { |id, quantity|
      if quantity[0].to_i == 0
        next
      end
      @order_waffle = OrderWaffle.new
      @order_waffle.order = @order
      @order_waffle.waffle = Waffle.find(id)
      @order_waffle.quantity = quantity[0]
      @order_waffle.save

      price += quantity[0].to_i * Waffle.find(id).price
    }

    @order.shop_id =  params[:order][:shop_id]

    respond_to do |format|
      if @order.update(price: price)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:price, :date)
    end
end
