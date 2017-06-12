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

  it 'will reject withdrawal request if balance is less than amount' do
    expect { account.withdraw(5) }.not_to change { account.balance }
  end
end
