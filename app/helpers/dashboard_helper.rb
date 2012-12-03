module DashboardHelper
  def pacman_loading_animation
    image_tag "pacman_loading.gif", :class => 'load_animation'
  end
  
  def popover_content(stat)
    render partial: "/dashboard/popover_content/#{stat.to_s}"
  end
end
