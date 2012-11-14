class DashboardController < ApplicationController
  layout :resolve_layout

  def index
  end

  def show
  end

  def resolve_layout
    case action_name
    when 'show'
      'application_empty'
    else
      'application'
    end
  end
end
