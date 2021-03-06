require 'pry'

class CashRegister
  attr_accessor :total, :last_price
  attr_reader :discount, :items

  def initialize(discount = nil) # if no discount is offered, then the discount is set to nil or zero
    @total = 0
    @discount = discount
    @items = [] # every new item (we purchase) will be pushed to this array (created with only 2 errors left)
    @last_price = 0
  end

  def add_item(title, price, quantity = 1) # when you're not given a quantity but you're given an item, then you have 1 item.
    @total = @total + (price * quantity)
    #@total += price * quantity shorthand
    quantity.times { @items << title }
    @last_price = price
  end

  def apply_discount
    if @discount == nil # i.e. there is no discount
      "There is no discount to apply."
    else
      @total -= @discount.to_f / 100 * @total
        "After the discount, the total comes to $#{@total.to_i}."
   end
  end

  def void_last_transaction
    @total = @total - @last_price
  end


end
