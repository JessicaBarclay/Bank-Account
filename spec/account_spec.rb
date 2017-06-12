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

    it 'adds deposits to transactions array with timestamp and balance after deposit' do
      expect(account.transactions[0]).to eq transaction
    end

    it 'adds multiple deposit transactions' do
      account.deposit(12.75)
      expect(account.transactions).to eq [{@timestamp.strftime('%d/%m/%Y')=>[10, 10]},
                                          {@timestamp.strftime('%d/%m/%Y')=>[12.75, 22.75]}]
    end
  end

  context 'make deposit and withdrawal to create transaction' do
    before do
      account.deposit(275)
      account.withdraw(24.50)
      @timestamp = Time.now
      allow(Time).to receive(:now).and_return(@timestamp)
    end

    it 'adds withdrawals to transactions array with timestamp and balance after withdrawal' do
      expect(account.transactions).to eq [{@timestamp.strftime('%d/%m/%Y')=>[275, 275]},
                                          {@timestamp.strftime('%d/%m/%Y') => [24.50, 250.50]}]
    end
  end
end
