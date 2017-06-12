class Transaction
  attr_reader :date, :type, :amount, :balance

  def save(amount, balance, type)
    @type = type
    @amount = sprintf('%0.2f', amount)
    @balance = sprintf('%0.2f', balance)
    @date = timestamp
  end

  private
  def timestamp
    Time.now.strftime('%d/%m/%Y')
  end
end
