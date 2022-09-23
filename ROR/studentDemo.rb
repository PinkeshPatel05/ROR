class Student
    
    @@rollNum
    @@studName   
    @@mark1  
    @@mark2 
    @@mark3  
    @@totalMarks 
    

    def self.setStudDetails
        puts "Please Enter Student Details\n"
        puts "Rollno\n"
        @@rollNum = gets.chomp.to_i
        puts "Name\n"
        @@studName = gets.chomp
        puts "mark1\n"
        @@mark1 = gets.chomp.to_i
        puts "mark2\n"
        @@mark2 = gets.chomp.to_i
        puts "mark3\n"
        @@mark3 = gets.chomp.to_i
        calculateTotal
        end
    
    def self.displayStudDetails
        print "RollNum: ",@@rollNum,"\n";
        print "Name: ",@@studName,"\n";
        print "Total Marks:  ",@@totalMarks,"\n\n";
    end        

    
def self.calculateTotal
    @@totalMarks = @@mark1+@@mark2+@@mark3
    
    displayStudDetails
end
end

class StudentDemo
    Student.setStudDetails
end




