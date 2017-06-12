describe PrintStatement do
  alias_method :print_statement, :subject
  it { is_expected.to respond_to(:bank_statement) }
end
