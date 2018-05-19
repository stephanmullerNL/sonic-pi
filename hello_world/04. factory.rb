use_bpm 40

def pattern(p)
  return p.ring.tick(p) == 'x'
end

live_loop :brr do
  sample :glitch_bass_g
  sleep 1
end

live_loop :zim, sync: :brr do
  play_chord (scale :c3, :augmented), sustain: 2
  sleep 4
end

live_loop :percussion do
  sample :glitch_perc4, amp: 1, on: pattern('x---')
  sample :glitch_perc2, on: pattern('x----x--')
  sample :glitch_perc5, on: pattern('--x-')
  sleep 0.25
end

live_loop :chaka do
  sleep 7.5
  with_fx :echo, decay: 4, phase: 0.125 do
    sample :perc_impact1, beat_stretch: 0.2, on: pattern('x--')
  end
  with_fx :echo, decay: 4, phase: 0.15 do
    sample :perc_impact1, beat_stretch: 0.3, on: pattern('x---')
  end
  sleep 0.5
end

notes = [54, 55, 56, 57].ring
live_loop :boop do
  use_synth :beep
  with_fx :reverb, room: 0.4 do
    play notes.tick, release: 0.2, on: pattern('xxx-x-xx'), lpf: 70
    sleep 0.25
  end
end

live_loop :sprinkle do
  6.times do
    sample :guit_harmonics, onset: choose
    sleep 0.125
  end
  sleep 4.25
end
