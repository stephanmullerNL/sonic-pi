use_bpm 92

notes = [30, 30, 33, 30, 32, 30, 35, 30, 33, 30, 37, 33, 35, 32, 30, 30, 30, 33, 30, 32, 30, 35, 30, 33, 30, 37, 33, 35, 32].ring
pause = (knit 0, 11, 1, 1, 0, 1, 1, 1, 0, 12, 1, 1, 0, 1, 1, 1).ring

16.times { puts notes.length }

live_loop :tick do
  sample :drum_cymbal_closed
  sleep 0.8
end

live_loop :bassline do
  tick
  
  ##| with_fx :distortion do
  use_synth :blade
  play notes.look, release: 0.2
  16.times do
    puts notes.look if pause.look > 0
  end
  
  sleep 0.2
  sleep 0.1  if pause.look > 0
end