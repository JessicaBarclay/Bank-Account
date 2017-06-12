class Statement
  def print_bank_statement(account)
    transactions = account.transactions.reverse
    statement = ''

    transactions.each do |transaction|
      date = transaction.first[0]
      credit_or_debit = transaction.values[0][0]
      amount = transaction.values[0][1]
      balance = transaction.values[0][2]
      statement = "|| credit || debit || balance\n " +
      "#{date} || #{credit_or_debit == 'credit' ? amount : ''} || #{credit_or_debit == 'debit' ? amount : ''}|| #{balance}"
    end
    p statement
  end
end
