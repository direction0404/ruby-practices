#!/usr/bin/env ruby

require "date"
require "optparse"

today = Date.today
year = today.year
month = today.month
day = today.day

OptionParser.new do |opts|
  opts.on("-y", "--year YEAR", Integer) do |y|
    year = y || today.year
  end

  opts.on("-m", "--month MONTH", Integer) do |m|
    month = m || today.month
  end
end.parse!

puts "#{month}月 #{year}".center(20)
puts "日 月 火 水 木 金 土"

day_of_week = Date.new(year,month).wday

# 1を月の初日に合わせる
print "   " * day_of_week

first_day = Date.new(year, month, 1)
last_day = Date.new(year,month,-1)
(first_day..last_day).each do |date|
  print date.day.to_s.center(3)
  if date.saturday? || date == last_day
    puts
  end
end
