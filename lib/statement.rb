class Statement
  def print_bank_statement(account)
    print "|           date           ||        credit        ||" +
          "        debit        ||        balance          |\n"
    account.transactions.each do | transaction |
      puts "|        #{transaction.date}        ||" +
           "      #{transaction.type == 'credit' ? transaction.amount : '   '}           ||" +
           "         #{transaction.type == 'debit' ? transaction.amount : '   '}           ||" +
           "       #{transaction.balance}            |\n"
    end
  end
end
