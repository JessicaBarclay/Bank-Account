### Installation

```
git clone git@github.com:JessicaBarclay/bank-account.git
cd bank-account
```
#### Start banking!
```
irb
require './lib/account'
require './lib/statement'
# now begin banking!
account = Account.new
account.deposit(12)
statement.print_bank_statement(account)
=>
"|| credit || debit || balance"
"12/06/2017 || 12.00 || || 12.00"
```
