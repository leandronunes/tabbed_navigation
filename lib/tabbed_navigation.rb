# TabbedNavigation

module TabbedNavigation

  module Controller

    def add_tab(&block)
      @tabs = Array.new unless @tabs     
      tab = TabNavigation::Tab.new(&block)
      @tabs.push(tab)
      tab
    end

  end #Controller

  module Helper
    def tabbed_navigation(tab_set = 'default', options = {})
      return '' unless @tabs
      content_tag(
        'ul', @tabs.select{ |t| (t.tab_set == tab_set) && (instance_eval(t.condition)) }.map { |t|
           active_options = (t.highlighted? params) ? { :class => 'active' } : {}
           content_tag('li', link_to(t.name, t.link, active_options ), t.options  )
         }.join("\n"), { :class =>  'tabs' }
      )
    end

  end #Helper

end
