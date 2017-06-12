class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push(credit_transaction(amount))
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
    @transactions.push(debit_transaction(amount))
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end

  def timestamp
    Time.now.strftime('%d/%m/%Y')
  end

  def credit_transaction(amount)
    transaction = { timestamp => ['credit', amount, @balance] }
  end

  def debit_transaction(amount)
    transaction = { timestamp => ['debit', amount, @balance] }
  end
end
