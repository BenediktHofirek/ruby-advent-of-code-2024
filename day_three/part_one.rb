#!/usr/bin/env ruby

sum = 0

File.foreach('input.txt') do |line|
  sum += line.scan(/mul\((\d{1,3}),(\d{1,3})\)/m).map { |(a, b)| a.to_i * b.to_i }.sum
end

p sum
