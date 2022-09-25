
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

    end
    if(charges<=50)
        total = minCharge
    elsif(charges<=300)
        total = charges+charges*0.05
    elsif(charges>300)
        total = charges+charges*0.15
        
    end
    
    customerDetail = {
        "Name" => name,
        "Units" => units,
        "Total Bill Amount" => total
    }
    $userWiseDetail.push(customerDetail)
end

puts "Enter Number of Users: "
number= gets.chomp.to_i 
customerArr= []
$userWiseDetail = []
number.times do |i|

    puts "Enter Name :"
    name = gets.chomp

    puts "Enter units: "
    units = gets.chomp.to_f
    customer = {
        "name": name,
        "units": units
    }
    customerArr.push(customer)
end

customerArr.each do |customer|
    calculateBill(customer[:units], customer[:name])
end

puts $userWiseDetail
    
