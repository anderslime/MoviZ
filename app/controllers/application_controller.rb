class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter do |controller|
  #   initalize_network unless controller.request.format.js?
  # end

  protected

  def current_network
    if id = session[:network_id]
      @network ||= Network.find(id)
    else
      session[:network_id] = (@network = Network.create).id
    end
    @network
  end

  private

  def initalize_network
    session[:network_id] = (@network = Network.create).id
  end

end
