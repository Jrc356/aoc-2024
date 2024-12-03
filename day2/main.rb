#!/usr/bin/env ruby

# frozen_string_literal: true

require '../lib/files'

INPUT_FILE_PATH = './input.txt'

def all_increasing(line)
  s = line.split(' ', -1)
  (s.length - 1).times do |i|
    if s[i + 1].to_i < s[i].to_i
      puts 'not all increasing'
      return false
    end
  end
  puts 'all increasing'
  true
end

def all_decreasing(line)
  s = line.split(' ', -1)
  (s.length - 1).times do |i|
    if s[i + 1].to_i > s[i].to_i
      puts 'not all decreasing'
      return false
    end
  end
  puts 'all decreasing'
  true
end

def all_same_change(line)
  all_increasing(line) || all_decreasing(line)
end

def is_gradually_changing(line)
  s = line.split(' ', -1)
  (s.length - 1).times do |i|
    change = (s[i].to_i - s[i + 1].to_i).abs
    if change < 1 || change > 3
      puts 'not all gradually changing'
      return false
    end
  end
  puts 'all gradually changing'
  true
end

def is_safe_report(line)
  puts "line - #{line}"
  return true if all_same_change(line) && is_gradually_changing(line)

  false
end

def part1(data)
  safe_reports = 0
  data.each do |line|
    if is_safe_report(line)
      puts 'safe'
      safe_reports += 1
    else
      puts 'unsafe'
    end
    puts '---'
  end
  safe_reports
end

def part2(data)
  safe_reports = 0
  data.each do |line|
    if is_safe_report(line)
      puts 'safe'
      safe_reports += 1
    else
      s = line.split(' ', -1)
      s.length.times do |i|
        puts 'dampening'
        if is_safe_report(s.dup.tap { |s| s.delete_at(i) }.join(' '))
          puts 'safe'
          safe_reports += 1
          break
        else
          puts 'unsafe'
        end
      end
    end
    puts '---'
  end
  safe_reports
end

data = read_file(INPUT_FILE_PATH)
puts '## Part 1 ##'
puts "part1: safe - #{part1(data)}"
puts '## Part 2 ##'
puts "part2: safe - #{part2(data)}"
