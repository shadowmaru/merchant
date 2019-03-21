#!/usr/bin/env ruby

require './lib/merchant'

def process_input(file_name)
  lines = []
  File.open(file_name, 'r').each_line do |line|
    lines << line
  end
  puts Merchant.call(lines)
end

if ARGV.empty?
  puts 'Please pass input file location as argument'
  exit 1
else
  process_input ARGV[0]
end
