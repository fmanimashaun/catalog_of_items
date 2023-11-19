require 'securerandom'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(params = {})
    @id = params[:id] || SecureRandom.uuid
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @items = params[:items] || []
  end
end
