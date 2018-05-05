cutoff = (range 50, 80, 1).mirror

live_loop :beat do
  sample :bd_haus, amp: 1, cutoff: cutoff.tick
  sleep 0.25
end

