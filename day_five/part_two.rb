#!/usr/bin/env ruby

sum = 0

source = File.read('input.txt').split.map { |line| line.downcase }

size = source.size - 1
for row in (1...size)
  for column in (1...size)
    next if source[row][column] != 'a'

    # from top-left clockwise
    surrounding = source[row - 1][column - 1] +
                  source[row - 1][column + 1] +
                  source[row + 1][column + 1] +
                  source[row + 1][column - 1]

    sum += 1 if surrounding.count('s') == 2 &&
                surrounding.count('m') == 2 &&
                (surrounding.include?('mm') || surrounding.include?('ss'))
  end
end

p sum
