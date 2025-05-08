#!/usr/bin/env ruby

counter = 0

def test_safety?(report)
  # excluding index 0 is same as testing whole report without any exclusion
  report_variants = (0...report.size).to_a.map do |excluded_index|
    report.reject.with_index { |_, row_index| row_index == excluded_index }
  end

  report_variants.any? do |report_variant|
    report_variant.each_with_index.all? do |value, index|
      index == (report_variant.size - 1) || (1..3).include?(report_variant.at(index + 1) - value)
    end
  end
end

File.foreach('input.txt') do |line|
  report = line.split.map { |n| n.to_i }

  # ensure report order is ascending
  report.reverse! if report.at(0) > report.at(-1) ||
                     report.at(0) > report.at(-2) ||
                     report.at(1) > report.at(-1)

  is_safe = test_safety?(report)

  counter += 1 if is_safe
end

p counter
