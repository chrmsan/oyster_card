class Oystercard
  attr_reader :balance
  DEFAULT_MAX_LIMIT = 90

  def initialize(limit=DEFAULT_MAX_LIMIT)
    @balance = 0
    @max_limit = limit
  end

  def top_up(value)
    fail "Can't top up to more than 90 GBP" if exceeds_limit?(value)
    @balance += value 
  end

  private

  def exceeds_limit?(value)
    (@balance + value) > @max_limit
  end
end
