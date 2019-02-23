class RegistrationsController < ApplicationController 
  protected
  
  def update_resource(resource, params)
    resource_update_without_paasword(params)
  end
end