#!/usr/bin/env ruby

# frozen_string_literal: true

INPUT_FILE_PATH = './input.txt'

def read_file(path)
  f = File.open(path)
  f.readlines.map(&:chomp)
end

def create_lists(data)
  list1 = []
  list2 = []
  data.each do |line|
    s = line.split('   ', -1)
    list1.append(s[0].to_i)
    list2.append(s[1].to_i)
  end
  [list1, list2]
end

def calc_diff(list1, list2)
  l1 = list1.sort
  l2 = list2.sort
  diffs = []
  l1.count.times do |i|
    d = l1[i] - l2[i]
    diffs.append(d.abs)
  end
  sum = 0
  diffs.each { |d| sum += d }
  sum
end

def create_count_map(list)
  m = {}
  list.each do |e|
    if m.key?(e)
      m[e] += 1
    else
      m[e] = 1
    end
  end
  m
end

def calc_similarity(list1, list2)
  m2 = create_count_map(list2)
  sim = 0
  list1.each do |e|
    sim += e * m2[e] if m2.key?(e)
  end
  sim
end

def part1
  data = read_file(INPUT_FILE_PATH)
  list1, list2 = create_lists(data)
  calc_diff(list1, list2)
end

def part2
  data = read_file(INPUT_FILE_PATH)
  list1, list2 = create_lists(data)
  calc_similarity(list1, list2)
end

puts "part1: #{part1}"
puts "part2: #{part2}"
