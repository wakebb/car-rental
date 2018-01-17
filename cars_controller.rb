class CarsController < ApplicationController

    def new
      @car = Car.new
    end

    def create
      @car = Car.new(car_params)
      if @car.save
        redirect_to @car, notice: 'Car is added successfully.'
      else
        render action: 'new'
      end
    end

    def index
    @cars = Car.all
    end

    def edit
    @car = Car.find(params[:id])
    # redirect_to @car, notice: 'Car is updated successfully.'
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render 'edit'
    end
  end

    def show
      @car = Car.find(params[:id])
    end

    def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  private

    def car_params
      params.require(:car).permit(:regnumber, :model, :capacity, :start_mileage,:status, :curr_rate, :pickup_address)
    end
end
