describe Transaction do
  alias_method :transaction, :subject
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:type) }
  it { is_expected.to respond_to(:amount) }
  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:save) }
end
