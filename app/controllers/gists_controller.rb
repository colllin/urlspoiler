require 'gist'
require 'ruby-debug'
class GistsController < ApplicationController
  
  after_filter :set_access_control_headers
  
  def index
    
    tail = params[:id] + '.js'
    tail += '?file=' + params[:file] if params[:file].present?
    # @uri = URI.parse("http://gist.github.com/#{tail}")
    #  req = Net::HTTP::Get.new(@uri.path)
    #  res = Net::HTTP.start(@uri.host, @uri.port) {|http|
    #    http.request(req)
    #  }
    #  
    # @gist_js = res.body
    @gist_js = Gist.get("http://gist.github.com/#{tail}")
    
    render 'index', :layout => nil if params[:format] == "html"
    
  end


  private

    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end
  
end
