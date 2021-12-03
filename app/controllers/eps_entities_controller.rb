class EpsEntitiesController < ApplicationController
  before_action :authenticate_user!
  def by_frecuency
    @eps_by_dependency
  end


end
