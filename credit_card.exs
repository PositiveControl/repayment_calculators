defmodule CreditCard do
  def balance_over_months(balance,_,0), do: IO.puts "$#{balance}, DONE!"
  def balance_over_months(balance, apr, months) do
    balance
      |> monthly_percentage(apr)
      |> print_result(months)
      |> balance_over_months(apr, months - 1)
  end

  def balance_over_months_with_payment(_,_,0,_), do: IO.puts "DONE!"
  def balance_over_months_with_payment(balance, apr, months, payment) do
    balance
      |> monthly_percentage(apr, payment)
      |> print_result(months)
      |> balance_over_months_with_payment(apr, months - 1, payment)
  end

  def months_to_payoff(balance, apr, payment), do: months_to_payoff(balance, apr, payment, 0)
  def months_to_payoff(balance, apr, payment, months) when balance > 0 do
    balance
      |> monthly_percentage(apr, payment)
      |> months_to_payoff(apr, payment, months + 1)
  end
  def months_to_payoff(_,_,_,months), do: IO.puts "#{months} months to payoff"

  defp daily_percentage_rate(apr), do: apr / 365

  defp monthly_percentage(balance, apr), do: monthly_percentage(balance, apr, 0)
  defp monthly_percentage(balance, apr, payment) do
    Float.ceil(
      (balance * (daily_percentage_rate(apr) * 30.42) + balance) - payment, 2
    )
  end

  defp print_result(amount, months) do
    IO.puts "#{months}: $#{amount}"
    amount
  end
end
