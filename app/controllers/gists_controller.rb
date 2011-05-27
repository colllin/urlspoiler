require 'gist'
class GistsController < ApplicationController
  
  after_filter :set_access_control_headers
  
  def index
    
    tail = (params[:id].present? ? params[:id] : '992729') + '.js'
    tail += '?file=' + params[:file] if params[:file].present?
    
    @gist_js = Gist.get("http://gist.github.com/#{tail}")
    
    case params[:format]
    when "html"
      render 'index', :layout => nil
    else
      render 'index', :layout => 'iframe'
    end
    
  end


  private

    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end
  
end
