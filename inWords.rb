readFile = File.open("input.txt")
writeFile = File.open("output.txt", 'w')
readFile.each_line do |line| 
    line.each_char do |char|

      if char == "1"
        numString =  'one'
      elsif char == "2"
        numString =  'two'
      elsif char == "3"
        numString =  'three'
      elsif char == "4"
        numString =  'four'
      elsif char == "5"
        numString =  'five'
      elsif char == "6"
        numString =  'six'
      elsif char == "7"
        numString =  'seven'
      elsif char == "8"
        numString =  'eight'
      elsif char == "9"
        numString = 'nine'
    elsif char == "0"
        numString =  'zero'       
    end
      writeFile.write(numString)
    end
    end
readFile.close
writeFile.close
puts File.readlines("output.txt")
  
