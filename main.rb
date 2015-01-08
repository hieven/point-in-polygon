require "matrix"
require "./lib/Point"
require "./lib/Polygon"



file = File.open("test.txt", 'r')

while !file.eof?
  nums = file.readline.to_i

  p = []
  for i in 1..nums
    tmp = file.readline.split(" ")
    p << Point[tmp[0].to_i, tmp[1].to_i, 0]
  end

  tmp = file.readline.split(" ")
  target = Point[tmp[0].to_i, tmp[1].to_i, 0]

  a = Polygon.new(p)
  puts a.isInside(target)
end

