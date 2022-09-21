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
leaf_count = prev_leaf_count + 1
level=("/" * leaf_count) + ("\\" * leaf_count)
@levels.insert(1,level)
end

@height = @height+1
end

#def coordinates
#end

def to_s
str = ""
@levels.reverse.each do |level|
padding = @height - level.size / 2
str += " " * padding + level + "\n"

end
return str
end
end