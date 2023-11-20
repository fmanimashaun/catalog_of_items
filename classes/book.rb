require_relative '../decorators/item_decorator'

class Book < ItemDecorator
  attr_accessor :cover_state, :publisher

  def initialize(params = {})
    super(Item.new(params))
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
