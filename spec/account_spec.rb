describe Account do
  alias_method :account, :subject
  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:withdraw) }

  it 'deposit specified amount to account balance' do
    expect { account.deposit(12) }.to change{ account.balance }.by 12
  end
end
