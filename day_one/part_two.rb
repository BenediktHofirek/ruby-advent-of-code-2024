#!/usr/bin/env ruby

list_one = []
list_two = []

File.foreach('input.txt') do |line|
  a, b = line.split
  list_one << a.to_i
  list_two << b.to_i
end

result = list_one.map { |e|
  e * list_two.count(e)
}.sum

puts result
