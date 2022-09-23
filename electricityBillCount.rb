print "Enter name : "
name = gets.chomp().to_s
print "ENter units: "
units = gets.chomp().to_i
def calculateBill(units,name)
 
    minCharge = 50
    charges = 0
    total = 0
    if (units <= 100)
      
        charges =  units * 6
     
    elsif (units <= 300)
     
        charges =  ((100 * 6) +
                (units - 100) * 11)
     
    elsif (units > 300)
     
        charges =  ((100 * 6) +
                (200 * 11) +
                (units - 300) * 15)
     
    #puts 0
    end
    if(charges<=50)
        total = minCharge
    elsif(charges<=300)
        total = charges+charges*0.05
    elsif(charges>300)
        total = charges+charges*0.15
        
    end
    puts "Total electicity charges for #{name} is: #{total}"
end

print(calculateBill(units,name))
    