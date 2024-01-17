# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

if frames[9][0] == 10 && frames[10][0] == 10
  frames[9] += frames[10] + frames[11]
  frames.pop(2)
elsif frames[9][0] == 10 && frames[10][0] != 10
  frames[9] += frames[10]
  frames.pop
elsif frames[9].sum >= 10
  frames[9] += frames[10]
  frames.pop
end

point = 0
frames.each_with_index do |frame, index|
  point += if index < 8
             if frame[0] == 10
               if frames[index + 1][0] == 10
                 frame.sum + frames[index + 1][0] + frames[index + 2][0]
               else
                 frame.sum + frames[index + 1][0] + frames[index + 1][1]
               end
             elsif frame.sum == 10
               frame.sum + frames[index + 1][0]
             else
               frame.sum
             end
           elsif index == 8
             if frame[0] == 10
               if frames[index + 1][0] == 10
                 frame.sum + frames[index + 1][0] + frames[index + 1][2]
               else
                 frame.sum + frames[index + 1][0] + frames[index + 1][1]
               end
             else
               frame.sum
             end
           else
             frame.sum
           end
end
puts point
