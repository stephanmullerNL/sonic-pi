paradiddle = (ring -1, 1, -1, -1, 1, -1, 1, 1)

live_loop :snare do
  with_fx :krush do
    sample :drum_snare_soft, pan: paradiddle.tick, cutoff: 80
    sleep 0.25
  end
end

live_loop :hihat do
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5
end
