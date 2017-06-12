describe Account do
  alias_method :account, :subject
  it { is_expected.to respond_to(:balance) }

  it 'deposit specified amount to account balance' do
    expect { account.deposit(12) }.to change { account.balance }.by 12
  end

  it 'withdraw specified ammount from account balance' do
    expect { account.withdraw(8) }.to change { account.balance }.by -8
  end
end
