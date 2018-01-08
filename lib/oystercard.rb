class Oystercard

  attr_reader :balance

  INITIAL_BALANCE = 0.00
  BALANCE_LIMIT = 90.00
  MINIMUM_FARE = 1.00

  def initialize
    @balance = INITIAL_BALANCE
    @in_use = false
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
    @in_use
  end

  def touch_in
    balance_error = "Balance is below the minimum fare of £#{Oystercard::MINIMUM_FARE}"
    raise balance_error if @balance < 1
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
