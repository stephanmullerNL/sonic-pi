fadein = (ramp *range(0, 1, 0.01))
notes = (chord :c2, :minor).shuffle.take(8)
use_synth :dsaw

live_loop :beat do
  tick
  ##| play :c2, release: 0, sustain: 0.3, amp: fadein.look
  play notes.look, release: 0, sustain: 0.3, amp: fadein.look
  sample :bd_haus, amp: fadein.look
  sleep 0.5
end

