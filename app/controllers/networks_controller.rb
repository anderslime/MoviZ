class NetworksController < ApplicationController
  def nerd_facts
    service = NetworkNerdFactsService.new(current_network)
    render :json => service.facts_to_json
  end

  def communities
    render :json => NetworkxGraph.by_network(current_network).communities
  end
end
