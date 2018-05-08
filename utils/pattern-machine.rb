bass = 'X-x-'
crash = '---.---.---.---X' # Dots are just used to keep count
hihat = 'xx-x'
snares = 'x-X--xX-'

define :pattern do | pattern, soft, hard, time = 4.0 |
  pattern.length.times do | i |
    beat = pattern[i]
    sample soft, on: beat == 'x'
    sample hard, on: beat == 'X'
    sleep 1 / time
  end
end

live_loop :tick do
  sleep 0.25
end

live_loop :snare, sync: :tick do
  pattern snares, :drum_snare_soft, :drum_snare_hard
end

live_loop :hihat, sync: :tick do
  pattern hihat, :drum_cymbal_closed, :drum_cymbal_open
end

live_loop :bass, sync: :tick do
  pattern bass, :drum_bass_soft, :drum_bass_hard
end


live_loop :crash, sync: :tick do
  pattern crash, :drum_splash_soft, :drum_splash_hard
end
