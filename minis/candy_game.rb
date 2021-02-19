total_candies = 32
puts "There are a total of #{total_candies} to pick from"

loop do
  computer_choice = total_candies % 3
  if computer_choice > 0
    total_candies -= computer_choice
  else
    total_candies -= 1
  end

  puts "Computer takes a turn... number of candies left is #{total_candies}"

  if total_candies == 0
    puts "Computer wins"
    break
  end
  print "Enter the number of candies (1 or 2): "
  total_candies -= gets.chomp.to_i
  puts "Number of candies left is #{total_candies}"
  if total_candies <= 0
    puts "You win!"
    break
  end
end
