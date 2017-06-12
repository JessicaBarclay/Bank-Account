require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, transaction = Transaction.new)
    @balance += amount
    transaction.save(amount, @balance, 'credit')
    @transactions.push(transaction)
  end

  def withdraw(amount, transaction = Transaction.new)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
    transaction.save(amount, @balance, 'debit')
    @transactions.push(transaction)
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end
end
