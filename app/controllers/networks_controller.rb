class NetworksController < ApplicationController
  def nerd_facts
    service = NetworkNerdFactsService.new(current_network)
    render :json => service.facts_to_json
  end
end
