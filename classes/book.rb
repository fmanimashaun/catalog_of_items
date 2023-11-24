require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :cover_state, :publisher
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'id' => @id,
      'author' => @author
    }.to_json
  end
end
