require 'securerandom'

class Item
  def initialize(params = {})
    @id = params[:id] || SecureRandom.uuid
    @genre = params[:genre]
    @author = params[:author]
    @source = params[:source]
    @label = params[:label]
    @publish_date = params[:publish_date]
    @archived = params[:archived] || false
  end
end
