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

  context 'make deposit and create transaction' do
    before do
      account.deposit(10)
      @timestamp = Time.now
      allow(Time).to receive(:now).and_return(@timestamp)
    end

    let(:transaction) { { @timestamp.strftime('%d/%m/%Y') => [10, 10] } }

    it 'adds deposits to transactions array with timestamp, and balance at time' do
      expect(account.transactions[0]).to eq transaction
    end

    it 'adds multiple deposit transactions' do
      account.deposit(12.75)
      expect(account.transactions).to eq [{"12/06/2017"=>[10, 10]}, {"12/06/2017"=>[12.75, 22.75]}]
    end
  end
end
