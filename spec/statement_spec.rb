describe Statement do
  alias_method :statement, :subject

  it 'pretty print account transactions' do
    account = Account.new
    account.deposit(100)
    account.withdraw(50)
    expect { statement.print_bank_statement(account) }.to output.to_stdout
  end

end
