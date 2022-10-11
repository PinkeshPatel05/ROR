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
@fTotal = 0
@bawllingEconomy
@playerName
@playerRuns
@striker
@nonStriker

@currentlyPlaying1
@currentlyPlaying2
@currentlyPlaying = "A"
@p1=0
@p2=0
$playerWiseDetail = []

def self.played(t1,t2,noOfBalls)
	o1 = [1, 4, 4, 2, 6, nil] 
	outByArr = ['caught behind', 'stumping', 'lbw', 'runout', 'catch out', 'bold']
	@total = 0
	n = 0
	m = 1
	@p1 = 0
	@p2 = 0

	balls = 0
	oversFinished = 0
	
	players = t1[n..m]
	@striker = players[0]
	@nonStriker = players[1]
	noOfBalls.times do |i|
		players.each do |a|
		a= @striker
		  ball = o1.shuffle.first
		  outBy = outByArr.shuffle.first
		  if ball == nil
		    puts "#{a} gets out - "  "#{outBy}"
		    t1.delete(a)
			saveScore(a,@p1)
			player_out
			check_striker(ball,balls)
			puts "Choose next player for batting: "
			nextPlayer = gets.chomp
			t1 = t1.insert(1, t1.delete_at( t1.index(nextPlayer) ))
			
		    puts "Players remaining are #{t1.count}"
		    players = t1[n..m]
			a =  players[0]
			@striker = a
			@nonStriker = players[1]
			  puts "Innings end \n\n\n" if t1 == []
			  puts "Total runs scored #{@total} \n\n" if t1 == []
		  	puts "New player came to bat #{players}" if players && players.any?
		  	abort("Innings ended with total runs of #{@total}") if players == nil
		  else
		    puts "#{a} hits a #{ball} runs"
		    @total = @total + ball
			add_runs(ball) 
			saveScore(a,@p1) if i == noOfBalls
			saveScore(a,@p2) if i == noOfBalls
		    abort("Innings ended with total runs of #{@total}") if i == noOfBalls
		  end
		  balls = balls + 1
		  
		  check_striker(ball,balls) if ball != nil
		  puts "Total runs after this over #{@total} \n\n" if balls % 6 == 0 
		  
		  if( balls % 6 == 0 )
			oversFinished = oversFinished + 1 if balls % 6 == 0 
		  	runRates = @total/oversFinished if balls % 6 == 0 
			calcBowlingEconomy(@total, oversFinished)
			puts "Bawlling Economy is #{@bawllingEconomy}"
		  	puts "Current Run Rate is #{runRates}" if balls % 6 == 0 
			if(oversFinished < @totalOvers &&  @fTotal > 0)
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
end

def self.change_striker
	@striker, @nonStriker = @nonStriker, @striker
	if @currentlyPlaying == "A"
		@currentlyPlaying = "B"
	else
		@currentlyPlaying = "A"
	end
end

def self.check_striker(runs,balls)
	if(runs==nil)
		@currentlyPlaying = "A"
	elsif (runs.odd?) && (balls % 6 != 0)
		change_striker
	elsif ((runs.even?) || (runs == 0)) && (balls % 6 == 0)
		change_striker
	end
end

def self.add_runs(runs)
	if @currentlyPlaying == "A"
    	@p1 += runs
	else 
		@p2 += runs
	end
end

def self.saveScore(a,runs)
	playerDetail = {
		a => runs
	}
	$playerWiseDetail.push(playerDetail)
end

def self.player_out
	if @currentlyPlaying == "A"
    	@p1 = 0
	else 
		@p2 = 0
	end
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
	
	puts "\nNow India will come to bat"
	played(t1,t2,noOfBalls)
	secondTotal = @total
	puts "Total runs by Australia #{secondTotal}"
	if firstTotal > secondTotal
		puts "Australia won the match by #{firstTotal - secondTotal} runs"
		puts $playerWiseDetail
	else
		puts "India won the match by #{secondTotal - firstTotal} runs"
		puts $playerWiseDetail
	end
end
end