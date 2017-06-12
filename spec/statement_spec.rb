describe Statement do
  alias_method :statement, :subject

  it 'pretty print account transactions' do
    account = Account.new
    account.deposit(100)
    account.deposit(2500)
    account.withdraw(500)
    expect(statement.print_bank_statement(account)).to eq "|| credit || debit || balance\n" +
                                                          " 12/06/2017 || 100 || || 100"
  end
end
