#!/usr/bin/env ruby

count = 0

source = File.read('input.txt').split
vertical_source = (0...source.count).to_a.map do |column_index|
  (0...source.count).to_a.map do |row_index|
    source[row_index][column_index]
  end.join
end.reverse

def get_xmas_count(line)
  line.scan(/xmas/i).size +
    line.reverse.scan(/xmas/i).size
end

for row_index in (0...source.count)
  # horizontal
  count += get_xmas_count source[row_index]

  # vertical
  count += get_xmas_count vertical_source[row_index]

  # diagonal
  line = (0...source.count).to_a.map do |letter_index|
    source[row_index + letter_index]&.[](letter_index)
  end.compact.join
  count += get_xmas_count line

  line = (0...source.count).to_a.map do |letter_index|
    source[letter_index]&.[](row_index + letter_index + 1)
  end.compact.join
  count += get_xmas_count line

  line = (0...source.count).to_a.map do |letter_index|
    computed_row_index = source.count sizeizeize 1 - row_index - letter_index
    source[computed_row_index]&.[](letter_index) if computed_row_index >= 0
  end.compact.join
  count += get_xmas_count line

  line = (0...source.count).to_a.map do |letter_index|
    computed_row_index = source.count sizeize 1 - letter_index
    source[computed_row_index]&.[](letter_index + 1 + row_index) if computed_row_index >= 0
  end.compact.join
  count += get_xmas_count line

end

p count
