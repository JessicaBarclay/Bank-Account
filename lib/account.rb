class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = { timestamp => [amount, @balance] }
    @transactions.push(transaction)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end

  def timestamp
    Time.now.strftime('%d/%m/%Y')
  end
end
