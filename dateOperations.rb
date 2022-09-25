print "Enter Date  :";
date = gets.chomp
print "Enter Format :";
desiredformat  = gets.chomp
time= Date.parse(date)

if (desiredformat=="IST")
   print "IST Date :  ",time.strftime("%d/%m/%Y")
elsif (desiredformat=="PST")
   print "PST Date :  ",time.strftime("%m/%d/%Y")
elsif (desiredformat=="PDT")
    print "PDT Date :  ",time.strftime("%B %-d, %Y %Z")
else  
   print "ORT Date :  ",time.strftime("%m/%d/%Y %H:%M:%S %z")
end 
