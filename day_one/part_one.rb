#!/usr/bin/env ruby

list_one = []
list_two = []

File.foreach('input.txt') do |line|
  a, b = line.split
  list_one << a.to_i
  list_two << b.to_i
end

list_one.sort!
list_two.sort!

result = 0
for row_index in 0...list_one.count
  diff = list_one[row_index] - list_two[row_index]
  abs_diff = diff.abs
  result += abs_diff
end

puts result
