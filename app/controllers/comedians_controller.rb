class ComediansController < ApplicationController
  def index
    if params[:age]
      @comedians = Comedian.age_filter(params[:age])
    else
      @comedians = Comedian.all
    end
  end
end
