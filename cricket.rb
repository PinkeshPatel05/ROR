class Cricket
#Team 1
t1 = ['Virat Kohli','KL Rahul', 'Rohit Sharma','Suryakumar Yadav','Dinesh Karthik','Rishabh Pant(w)','Axar Patel','Ravichandran Ashwin','Harshal Patel','Deepak Chahar','Arshdeep Singh']
#Team 2
t2 = ['Steve Smith','Tim David','Aaron Finch','Glenn Maxwell','Ashton Agar','Cameron Green','Josh Inglis(w)','Daniel Sams','Sean Abbott','Matthew Wade','Pat Cummins']
coin = ['Heads','Tails']
typeOfMatch=""
ballsForT20 = 6
ballsForOthers = 12
@totalOvers = 0
@firstTemaScire = 0
# firstTotal = 0
@fTotal = 0
@bawllingEconomy
@playerName
@playerRuns

def self.played(t1,t2,noOfBalls)
	o1 = [1, 4, 4, 2, 6, nil] 
	outByArr = ['caught behind', 'stumping', 'lbw', 'runout', 'catch out', 'bold']
	@total = 0
	n = 0
	m = 1

	balls = 0
	oversFinished = 0
	
	players = t1[n..m]
	noOfBalls.times do |i|
		players.each do |a|

		  ball = o1.shuffle.first
		  outBy = outByArr.shuffle.first
		  if ball == nil
		    puts "#{a} gets out - "  "#{outBy}"
		    t1.delete(a)
			
			puts "Choose next player for batting: "
			nextPlayer = gets.chomp
			t1 = t1.insert(1, t1.delete_at( t1.index(nextPlayer) ))
			
		    puts "Players remaining are #{t1.count}"
		    players = t1[n..m]
			  puts "Innings end \n\n\n" if t1 == []
			  puts "Total runs scored #{@total} \n\n" if t1 == []
		  	puts "New player came to bat #{players}" if players && players.any?
		  	abort("Innings ended with total runs of #{@total}") if players == nil
		  else
		    puts "#{a} hits a #{ball} runs"
		    @total = @total + ball
		    abort("Innings ended with total runs of #{@total}") if i == noOfBalls
		  end
		  balls = balls + 1
		  puts "Total runs after this over #{@total} \n\n" if balls % 6 == 0 
		  
		  if( balls % 6 == 0 )
			oversFinished = oversFinished + 1 if balls % 6 == 0 
		  	runRates = @total/oversFinished if balls % 6 == 0 
			calcBowlingEconomy(@total, oversFinished)
			puts "Bawlling Economy is #{@bawllingEconomy}"
		  	puts "Current Run Rate is #{runRates}" if balls % 6 == 0 
			if(oversFinished < @totalOvers &&  @fTotal > 0)
				# remainingOvers = @totalOvers-oversFinished
				reqRate = @fTotal - @total
				puts "Required run Rate is #{reqRate}"
				
			end
		  end
		end
	end
	return @total
end

#Bowling economy
def self.calcBowlingEconomy(runs, noOfOvers)
	@bawllingEconomy = runs/noOfOvers
	# return @bawllingEconomy
end

def self.change_striker
	@striker, @non_striker = @non_striker, @striker
end

puts "Teams are India and Australia \n\n "
puts "Enter type of match: "
typeOfMatch = gets.chomp
puts "Enter captain name for Team India"
t1Captain = gets.chomp
puts "Enter captain name for Team Australia"
t2Captain = gets.chomp 
if(typeOfMatch=="t20")
	@totalOvers = 1
    noOfBalls = ballsForT20/2
else 
	@totalOvers = 2
    noOfBalls = ballsForOthers/2
end

t1= t1.map { |x| x == t1Captain ? t1Captain +'(c)' : x }
t2= t2.map { |y| y == t2Captain ? t2Captain +'(c)' : y }



puts "Playing XI for India are #{t1.join(",")} \n\n  "
sleep 1
puts "Playing XI for Australia #{t2.join(",")} \n\n "
sleep 1


puts "Coin Tossed"
if coin.shuffle.first == 'Heads'
	puts "India won the toss and selected to bat first"
	puts "Match Starts"
	played(t1,t2,noOfBalls)
	firstTotal = @total
	@fTotal = @total
	puts "Total runs by India #{firstTotal}"
	# sleep 2
	puts "\nNow Australia will come to bat"
	played(t2,t1,noOfBalls)
	secondTotal = @total
	puts "Total runs by Australia #{secondTotal}"
	if firstTotal > secondTotal
		puts "India won the match by #{firstTotal - secondTotal} runs"
	else
		puts "Australia won the match by #{secondTotal - firstTotal} runs"
	end
else
	puts "Australia won the toss and selected to bat first"
	puts "Match Starts"
	played(t2,t1,noOfBalls)
	firstTotal = @total
	@total =  @total
	@fTotal = @total
	puts "Total runs by Australia #{firstTotal}"
	sleep 2
	puts "\nNow India will come to bat"
	played(t1,t2,noOfBalls)
	secondTotal = @total
	puts "Total runs by Australia #{secondTotal}"
	if firstTotal > secondTotal
		puts "Australia won the match by #{firstTotal - secondTotal} runs"
	else
		puts "India won the match by #{secondTotal - firstTotal} runs"
	end
end
end