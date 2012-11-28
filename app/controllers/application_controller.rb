class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  def current_network=(network)
    session[:network_id] = (@network = network.create).id
    @network
  end

  def current_network
    if id = session[:network_id]
      @network ||= Network.find(id)
    else
      session[:network_id] = (@network = Network.create).id
    end
    @network
  end
end
