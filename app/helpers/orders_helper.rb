module OrdersHelper

  def ordered
    @ordered = order.line_items
  end
end
