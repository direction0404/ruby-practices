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

frames = shots.each_slice(2).to_a

# 10フレーム目の結果により10フレーム目の要素を調整
if frames[9].sum == 10
  frames[9] += frames[10..].flatten
  frames.pop(frames.size - 10)
end

point = frames.each_with_index.sum do |frame, index|
  score = frame.sum
  next_frame_first = frames[index + 1][0] if index < 9
  if index < 9 && frame[0] == 10
    score += if index < 8 && next_frame_first == 10
               next_frame_first + frames[index + 2][0]
             elsif index == 8 && next_frame_first == 10
               next_frame_first + frames[index + 1][1] + frames[index + 1][2]
             else
               next_frame_first + frames[index + 1][1]
             end
  elsif index < 9 && score == 10
    score += next_frame_first
  end
  score
end
puts point
