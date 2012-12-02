class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all

  # before_filter do |controller|
  #   initalize_network unless controller.request.format.js?
  # end

  protected

  def current_network
    if id = cookies[:network_id]
      @network = Network.find(id)
    else
      @network = initalize_network
    end
    @network
  end

  private

  def initalize_network
    cookies[:network_id] = (@network = Network.create).id
  end

end
