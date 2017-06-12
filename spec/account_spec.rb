describe Account do
  alias_method :account, :subject
  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:deposit) }
  it { is_expected.to respond_to(:withdraw) }
end
