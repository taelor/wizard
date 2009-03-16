module Wizard
 
  module ViewHelpers
    def wizardly_div_for(model, options = {}, &block)
      content = capture(&block)
      
      classes = "wizard"
      classes += " "+options[:class].strip if options[:class]
      
      concat("<div id=\"#{model.wizard_id}\" class=\"#{classes}\">")
      concat(content)
      concat('</div>')
    end
      
  end
end
