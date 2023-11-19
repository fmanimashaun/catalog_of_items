require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

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
