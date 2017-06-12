class Statement
  def print_bank_statement(account)
    transactions = account.transactions.reverse
    statement = ''

    transactions.each do |transaction|
      date = transaction.first[0]
      credit_or_debit = transaction.values[0][0]
      amount = transaction.values[0][1]
      balance = transaction.values[0][2]
      statement = " #{date} || #{credit_or_debit == 'credit' ? sprintf("%0.2f", amount) : ''} " +
                  "||#{credit_or_debit == 'debit' ? sprintf("%0.2f", amount) : ''} ||"+
                  " #{sprintf("%0.2f", balance)}"
    end
    return "|| credit || debit || balance\n#{statement}"
  end
end
