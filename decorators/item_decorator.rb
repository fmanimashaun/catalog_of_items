class ItemDecorator
  def initialize(item)
    @item = item
  end

  def can_be_archived?
    @item.can_be_archived?
  end
end
