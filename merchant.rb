#!/usr/bin/env ruby

require './lib/merchant'

def process_input(file_name)
  File.open(file_name, 'r').each_line do |line|
    puts Merchant.call(line)
  end
end

if ARGV.empty?
  puts 'Please pass input file location as argument'
  exit 1
else
  process_input ARGV[0]
end
