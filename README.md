# Repayment Calculators

## `CreditCard` Module
### Functions
_Note:_
- `apr` should be as decimal (ex. 6.99% would be `0.0699`)
- For map arguments: `%{:at_month => [ex. 12], :amount => [ex. 300]}`
  * `:at_month` is the number of months from now that you would like to apply the additional payment.  So `:at_month => 6` would be six months from now.
  * `:amount` is the amount that you would like to increase your payment by. So if your `payment` is `100` and `:amount => 400`, your `payment` will increase to `500` at the specified month.
  

1. `.balance_over_months/3`
  * **Args:** `(beginning_balance, apr, months)`
  * Calculates what balance will be over x months.
1. `.balance_over_months_with_payment/4`
  * **Args:** `(beginning_balance, apr, months, payment)`
  * Calculates what balance will be over x months with consistent payment.
1. `.months_to_payoff/3`
  * **Args:** `(balance, apr, payment)`
  * Calculates how many months it will take to payoff with consistent payment.
1. `.months_to_payoff_w_bump/4`
  * **Args:** `(beginning_balance, apr, payment, %{:at_month => [ex. 12], :amount => [ex. 300]})`
  * Same as #months_to_payoff/3 but allows the ability to bump the payment at a specified month.

## More to Come
