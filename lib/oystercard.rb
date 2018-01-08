class Oystercard

  attr_reader :balance

  INITIAL_BALANCE = 0.00
  BALANCE_LIMIT = 90.00

  def initialize
    @balance = INITIAL_BALANCE
  end

  def topup(amount)
    balance_error = "This topup would exceed £#{BALANCE_LIMIT}"
    raise balance_error if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    false
  end

end
