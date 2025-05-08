#!/usr/bin/env ruby

sum = 0

is_enabled = true

File.foreach('input.txt') do |line|
  line.scan(/
    (?:
      mul\((\d{1,3}),(\d{1,3})\)
    ) |
    (do\(\)) |
    (don't\(\))
  /mx).each do |(a, b, enable_switch, disable_switch)|
    is_enabled = true if enable_switch
    is_enabled = false if disable_switch

    sum += a.to_i * b.to_i if is_enabled && a && b
  end
end

p sum
