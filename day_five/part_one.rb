#!/usr/bin/env ruby

def convert_to_integer(list)
  list.map do |value|
    if value.is_a?(Array)
      convert_to_integer value
    else
      value.to_i
    end
  end
end

raw_rules, raw_rows = File.read('input.txt').split(/\n{2,}/).compact.map do |part|
  part.split
end

rows = convert_to_integer(raw_rows.map { |row| row.split ',' })
rules_list = convert_to_integer(raw_rules.map { |rule| rule.split '|' })

rules = rules_list.each_with_object({}) do |(key, value), acc|
  acc[key] ||= []
  acc[key] << value unless acc[key].include?(value)
end

valid_rows = rows.filter do |row|
  reversed_row = row.reverse
  reversed_row.each_with_index.all? do |element, index|
    next true if index == reversed_row.size - 1

    (rules[element] || []).intersection(reversed_row[index + 1..]).empty?
  end
end

sum = valid_rows.reduce(0) do |sum, row|
  sum + row[row.size / 2]
end

p sum
