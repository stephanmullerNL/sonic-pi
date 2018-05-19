use_bpm 40
bla = '~/s/newshit/blabla.wav'
s = 1

def pattern(p)
  return p.ring.tick(p) == 'x'
end


live_loop :brr do
  sample :glitch_bass_g
  sleep 2
end

sleep 4 * s

live_loop :toms do
  5.times do
    sample :drum_tom_mid_soft
    sleep 0.1
  end
  sleep 12.5
end

live_loop :chaka do
  sleep 3.5
  with_fx :echo, decay: 4, phase: 0.125 do
    sample :perc_impact1, beat_stretch: 0.2, on: pattern('x--')
  end
  with_fx :echo, decay: 4, phase: 0.15 do
    sample :perc_impact1, beat_stretch: 0.3, on: pattern('x---')
  end
  sleep 3
end

sleep 16 * s

live_loop :percussion do
  sample :glitch_perc4, amp: 1, on: pattern('x---')
  sample :glitch_perc2, on: pattern('x----x--')
  sample :elec_blup, on: pattern('--x-')
  sleep 0.25
end


scales = [:c3, :d3, :f3, :d3].ring
live_loop :zim, sync: :brr do
  sc = scales.tick
  use_synth :mod_beep
  4.times do
    play_chord (scale sc, :gong), sustain: 2, release: 2
    sleep 4
  end
end

sleep 4 * s

live_loop :sprinkle do
  6.times do
    sample :guit_harmonics, onset: choose
    sleep 0.125
  end
  sleep 4.25
end

sleep 4 * s

onsets = [1, 3, 24, 26].ring
live_loop :bla, sync: :brr do
  with_fx :echo, decay: 4 do
    sample bla, onset: onsets.tick, amp: 2
    sleep 8
  end
end



notes = [54, 55, 56, 57].ring
live_loop :boop do
  use_synth :beep
  with_fx :reverb, room: 0.4 do
    ##| play notes.tick, release: 0.2, on: pattern('xx-xx-xx'), lpf: 70
    sleep 0.25
  end
end
