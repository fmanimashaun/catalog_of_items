require_relative 'item'

class Movie < Item
  attr_accessor :silent
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @silent = params[:silent] || false
  end

  def can_be_archived?
    super || @silent
  end
end
