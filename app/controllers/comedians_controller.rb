class ComediansController < ApplicationController
  def index
    if params[:age]
      @comedians = Comedian.age_filter(params[:age])
    else
      @comedians = Comedian.all
    end
  end

  def new
    @comedian = Comedian.new
  end

  def create
    comedian = Comedian.new(comedian_params)
    comedian.save
    redirect_to "/comedians"
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :city, :img_url)
  end
end
