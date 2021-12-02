class NoveltiesController < ApplicationController
  def new
    @novelty = Novelty.new
  end
end