class Statement
  def print_bank_statement(account)
    statement = ''

    account.transactions.each do | transaction |
      statement = " #{transaction.date} || #{transaction.type == 'credit' ? transaction.amount : ''} ||" +
                  " #{transaction.type == 'debit' ? transaction.amount : ''}      || #{transaction.balance}"
    end
    return "       date || credit || debit || balance\n#{statement}"
  end
end
