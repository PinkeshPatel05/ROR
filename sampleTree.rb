class SampleTree
def initialize
@height = 0
@levels=[]
end

def grow
case @height
when 0
@levels.push "|"
when 1
@levels[0] +="|"
@levels.push "/\\"
when 2
@levels.insert(1,"//\\\\")
else
prev_leaf_count = @levels[1].length / 2
#puts @levels[1]
#puts  prev_leaf_count
#randomNo = rand(0..1)
#leaf_count = prev_leaf_count + rand(0..1)
#puts randomNo
leaf_count = prev_leaf_count + 1
#puts  leaf_count
level=("/" * leaf_count) + ("\\" * leaf_count)
#puts level
@levels.insert(1,level)
end
#@height +=1
@height = @height+1
end

def coordinates
end

def to_s
str = ""
#puts level
@levels.reverse.each do |level|
padding = @height - level.size / 2
str += " " * padding + level + "\n"
#puts  @height
end
return str
end
end