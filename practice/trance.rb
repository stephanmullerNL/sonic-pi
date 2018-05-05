16.times { puts sample_duration :bass_trance_c }

dens = (knit 1, 7, 4, 1).ring

live_loop :bass do
  sample :drum_cymbal_closed
  sample :bd_tek
  sleep 0.25
  sample :drum_cymbal_closed, sustain: 0.05
  sleep 0.25
end

live_loop :beat do
  density dens.tick do
    sample :bass_trance_c, sustain: 0.5
    sleep 0.5
  end
end

