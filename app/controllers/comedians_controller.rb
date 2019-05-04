class ComediansController < ApplicationController
  def index
    @comedians = Comedian.all
  end
end
