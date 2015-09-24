def total_bottles(initial_investment)
  total_bottles = 0
  # Convert initial purchase to bottles - $2/bottle
  total_bottles += initial_investment / 2
  empties = total_bottles
  cap_empties = empties
  # devide bottles by 2 for bottle recycle program - quotient is added to total_bottles, quotient and remainder are added to new variable 'empties'
  while empties >= 2 || cap_empties >= 4
    q_r_a = empties.divmod(2)
    total_bottles += q_r_a[0]
    empties = q_r_a[0] + q_r_a[1]

    empties_and_caps = cap_empties.divmod(4)
    total_bottles += empties_and_caps[0]
    cap_empties = q_r_a[0] + q_r_a[1] + empties_and_caps[0] + empties_and_caps[1]
  end
  return total_bottles
end


# Test with an initial purchase of $20
puts total_bottles(20)  # => 26

puts total_bottles(10)  # => 13

# puts total_bottles(30)

# puts total_bottles(99)