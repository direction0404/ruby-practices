#!/Users/tkhm/.rbenv/shims/ruby

require "date"
require "optparse"

# 今日の日付を定義
today = Date.today
year = today.year
month = today.month
day = today.day

# オプションパーサーの設定
OptionParser.new do |opts|
  opts.on("-y", "--year YEAR", Integer) do |y|
    year = y || today.year
  end

  opts.on("-m", "--month MONTH", Integer) do |m|
    month = m || today.month
  end
end.parse!

# 一番上の中央に年月を設置
puts "#{year}年#{month}月".center(20)

# 曜日を設置
puts " 日 月 火 水 木 金 土"

# 末日を定義
last = Date.new(year,month,-1)
last_day = last.day

# 年月の1日の曜日
day_of_week = Date.new(year,month).wday

# 1を月の初日に合わせる
print "   " * day_of_week

# 1から末日を表示
for i in (1..last_day) do
  if i <= 9
    print "  #{i}"
  else
    print " #{i}"
  end
  
# 土曜日の後ろに改行を入れる
  day_of_week = day_of_week + 1
  if day_of_week % 7 == 0
    puts "\n"
  end
end

# 最終日の補正
if day_of_week != 0
  puts "\n"
end
