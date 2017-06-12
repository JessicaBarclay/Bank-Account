describe Account do
  alias_method :account, :subject
  it { is_expected.to respond_to(:balance) }

  it 'deposit specified amount to account balance' do
    expect { account.deposit(12) }.to change { account.balance }.by 12
  end

  it 'withdraw specified ammount from account balance' do
    account.deposit(8)
    expect { account.withdraw(8) }.to change { account.balance }.by -8
  end

  it 'will reject withdrawal and raise error if account has insufficient funds' do
    expect { account.withdraw(5) }.to raise_error 'Insufficient funds'
  end

  it 'handles deposits to transactions array with timestamp and balance after deposit' do
    transaction = Transaction.new
    account.deposit(10, transaction)
    expect(account.transactions[0]).to eq transaction
  end
end
