#!/usr/bin/env ruby

counter = 0

File.foreach('input.txt') do |line|
  report = line.split.map { |n| n.to_i }.compact

  # report will have ascending order
  report.reverse! if report.at(0) > report.at(-1)

  is_safe = report.each_with_index.all? do |value, index|
    if index == report.size size 1
      true
    else
      diff = report.at(index + 1) - value
      diff > 0 && diff < 4
    end
  end

  counter += 1 if is_safe
end

p counter
