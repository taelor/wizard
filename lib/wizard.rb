$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))  

require 'active_support'

module Wizard
  VERSION = '0.0.1'

  class << self
    def enable
      return if ActionView::Base.instance_methods.include? 'wizardly_div'

      require 'wizard/view_helpers'
      ActionView::Base.class_eval { include ViewHelpers }

    end
  end

  module Resource

    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
    end

    def wizard_id
     self.class.get_wizard_id_prefix+'_'+self.to_param
    end

    module ClassMethods

      def wizard_link(link_name, link_url)
        @links = {} if !@links 
        @links[link_name] = link_url
      end

      def wizard_controller(controller)
        @wizard_controller = controller
      end

      def wizard_id_prefix(prefix)
        @wizard_id_prefix = prefix
      end

      def get_wizard_id_prefix()
        @wizard_id_prefix
      end

      ##todo build in model based styling. export to CSS?
      def css_height(height)
        @height = height
      end

      def css_width(width)
        @width = width
      end

      # prints out the header information so the jquery code knows what url should be in the dynamic wizard list.
      def wizard_header()
        header = '<meta name="wizard_controller" content="'+@wizard_controller+'" />'
        header += '<meta name="wizard_id_prefix" content="'+@wizard_id_prefix+'" />'
      end

      #prints out the intial wizard panel.
      def wizard_panel(params)
        left = params[:wizard_panel_left] || "0"
        top = params[:wizard_panel_top] || "0"

        style = "left:#{left};top:#{top};"

        panel = '
    <div id="wizard_panel" class="rounded" style="'+style+'">
      <div id="wizard_panel_content" class="rounded">
      	<div id="wizard_panel_handle" class="rounded handle">
      	</div>
      	<ul id="wizard_list">'
          	  @links.each do |link_name, link_url| 
                panel += "<li><a href=\"#{link_url}\">#{link_name}</a></li>"
              end
          	panel += '        </ul>
      </div>
    </div>'
      end
    end
  end
end

if defined?(Rails)
  Wizard.enable
end