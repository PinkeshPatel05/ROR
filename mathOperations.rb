A = [1,2,3,4]

B = [1,2,3] 

C = [5,6,7]
U = [1,2,3,4,5,6,7]
aORb = A|B
aAndB = A&B
aComplB = A-B
bORc = B|C


# puts "A U B : #{A|B}"
# puts "A N B : #{A&B}"
puts "A U B : #{aORb}"
puts "A N B : #{aAndB}"
puts "A complement B : #{aComplB}"
puts "A Product B : #{A.product(B)}"

#Commutative Law
#This law states that no matter in which order we use the variables. It means that the order of variables doesn't matter
#A+B = B+A
bORa = B|A
if(aORb==bORa)
    puts "Commutative Law Proved"
end

#Associative Law
#A + (B + C) = (A + B) + C
abc1 = A|bORc
abc2 = aORb|C
if(abc1==abc2)
    puts "Associative Law Proved"
end

#De Morgan Law
#(A+B)' = A'.B'
lhs = U - aORb

aCompl = U - A
bcompl = U - B
rhs = aCompl&bcompl

if(lhs==rhs)
    puts "De Morgan's Law Proved"
end
