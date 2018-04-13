use_bpm 100

live_loop :hihat do
  ##| sleep 0.1
  sample :drum_cymbal_closed, amp: 0.5, hpf: 5, rate: 1.85
  sleep 0.25
end

live_loop :kick do
  sample :drum_heavy_kick, amp:2
  sleep 1
  sample :drum_heavy_kick, rpitch: 3
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_heavy_kick, rpitch: 4
  sleep 0.25
end

live_loop :snare do
  sleep 0.5
  sample :drum_snare_soft
  sleep 0.5
end

live_loop :cymbal do
  sleep 4
  sample :ambi_choir, pitch: rrand(-3, 3), pan: rrand(-1, 1)
  ##| sleep 0.25
end


