class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def current_network
    if id = session[:network_id]
      @network ||= Network.find(id)
    else
      session[:network_id] = (@network = Network.create.id)
      @network
    end
  end
end
