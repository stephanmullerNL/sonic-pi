# Evolving?

use_bpm 100

x = []

live_loop :count do
  r = rrand(3, 6)
  x = (knit 1, r, 0, 8-r).shuffle
  sleep 16
end

live_loop :bass do
  sample :drum_bass_hard, amp: 3, on: x.tick
  sleep 0.5
end

live_loop :hihat do
  sample :drum_cymbal_closed, ampp: 0.7
  sleep 0.25
end

live_loop :snare do
  sleep 0.5
  sample :drum_snare_hard, amp: 0.8
  sleep 0.5
end

