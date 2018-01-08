class Oystercard

  attr_reader :balance

  BALANCE_LIMIT = 90.00

  def initialize
    @balance = 0.00
  end

  def topup(amount)
    balance_error = "This topup would exceed £#{BALANCE_LIMIT}"
    raise balance_error if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

end