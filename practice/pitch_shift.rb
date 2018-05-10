pitcher = range(0, 5, 0.1)
p = pitcher[0]
use_synth :dsaw

live_loop :pitch do
  tick_reset
  p = pitcher[0]
  play 40, sustain: 1, attack: 0, release: 0, pitch: p
  sleep 1
  32.times do
    p = pitcher.tick 
    play 40, sustain: 0.02, attack: 0, pitch: p
    sleep 0.02
  end
  play 40, sustain: 2, attack: 0, release: 0, pitch: p
  sleep 2
end

live_loop :note do
  use_synth :dsaw
  ##| play 40, sustain: 4, pitch: p
  sleep 4
end