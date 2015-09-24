def total_bottles(initial_investment)
  # What we start with
  full_bottles, dollars = initial_investment.divmod(2)
  total_bottles = 0
  empties = 0
  caps = 0
  bottle_from_bottles = 0
  bottle_from_caps = 0

  while full_bottles > 0
    # consume full to make empty bottles and caps
    empties += full_bottles
    caps += full_bottles
    total_bottles += full_bottles

    full_bottles, leftover_empties = empties.divmod(2)
    empties = leftover_empties
    bottle_from_bottles += full_bottles

    new_bottles, leftover_caps = caps.divmod(4)
    full_bottles += new_bottles
    caps = leftover_caps
    bottle_from_caps += new_bottles
  end
  puts "An initial investment of $#{initial_investment} will return a total of #{total_bottles} bottles, with #{empties} empty bottles, #{caps} caps, and $#{dollars} left over."
  puts "Your initial purchase yielded #{initial_investment / 2} bottles, and you received #{bottle_from_bottles} from exchanging bottles, and #{bottle_from_caps} from exchanging bottle caps."
end

# # Test with an initial purchase of *
# puts total_bottles(10)  # => 15

puts "How much money would you like to spend on pop today?"
amount = gets.chomp.to_i
total_bottles(amount)