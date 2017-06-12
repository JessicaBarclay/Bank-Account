class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end
end
