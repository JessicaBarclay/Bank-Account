describe Account do
  alias_method :account, :subject
  it { is_expected.to respond_to(:balance) }
end
