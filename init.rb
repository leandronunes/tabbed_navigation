# Include hook code here

require 'tabbed_navigation' 

class ActionController::Base

  def self.uses_tabbed_navigation
    include TabbedNavigation::Controller
    helper TabbedNavigation::Helper
  end

end
