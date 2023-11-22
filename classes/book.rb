require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :publisher
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
    @publish_date = params[:publish_date]
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
