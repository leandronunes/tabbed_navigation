# TabbedNavigation
module TabNavigation
  class Tab 
    attr_accessor :name, :link, :highlights, :not_highlights, :tab_set, :options, :condition

    def initialize(&block)
      self.tab_set = 'default'
      self.highlights = Array.new
      self.not_highlights = Array.new
      self.condition = "true"
      self.options = {}
      self.link = {}
      instance_eval(&block) unless block.nil?

      if self.highlights.empty?
        highlights_on(self.link)
      end

    end

    def named name
      check_string name
      self.name = name
    end
    
    def links_to options={}
      check_hash options
      self.link = options
    end

    def in_set set
      self.tab_set = set
    end

    def highlights_on options={}
      check_hash options
      tmp_hash = Hash.new
      options.each{|k,v| tmp_hash[k.to_s] = v.to_s}
      self.highlights << tmp_hash
    end

    def highlights_off options_off={}
      check_hash options_off      
      tmp_hash = Hash.new
      options_off.each{|k,v| tmp_hash[k.to_s] = v.to_s}
      self.not_highlights << tmp_hash
    end
    
    def highlighted? params={}
      return false unless self.highlights || params 


      self.not_highlights.each { |link|
        match = false
        link.each { |k,v|
          if params[k].nil? or !(params[k] == v)
            match = true
            break
          end
        }
        return false if not match 
      }

      self.highlights.each { |link|
        match = true
        link.each{ |k,v|
          if params[k].nil? or !(params[k] == v)
            match = false
          end
        }
        return true if match
      }

      return false
    end

    def show_if condition
      self.condition = condition
    end

    def html_options options={}
      check_hash options      
      self.options.merge! options
    end

    private

    def check_string param
      raise "param should be a String" if not param.kind_of? String
    end

    def check_hash param
      raise "param should be a Hash" if not param.kind_of? Hash
    end

  end

end
