class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push(transaction(amount))
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
    @transactions.push(transaction(amount))
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end

  def timestamp
    Time.now.strftime('%d/%m/%Y')
  end

  def transaction(amount)
    transaction = { timestamp => [amount, @balance] }
  end
end
