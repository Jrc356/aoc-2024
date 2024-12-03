#!/usr/bin/env ruby

# frozen_string_literal: true

require '../lib/files'

def part1(data)
  sum = 0
  re = /mul\(([0-9]+),([0-9]+)\)/
  matches = data.scan(re)
  matches.each do |m|
    e1 = m[0].to_i
    e2 = m[1].to_i
    sum += e1 * e2
  end
  sum
end

data = read_file(INPUT_FILE_PATH).join('')
puts '## Part 1 ##'
puts "part1: #{part1(data)}"
