pitcher = range(0, 5, 0.1)
p = pitcher[0]
use_synth :dsaw

live_loop :note do
  with_fx :pitch_shift, pitch_slide: 1 do | fx |
    note = play 40, sustain: 4
    sleep 1
    control fx, pitch: 5
    sleep 3
  end
end