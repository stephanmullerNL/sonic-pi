use_tuning :just

r = (scale :c1, :augmented)

live_loop :humm do
  with_fx :slicer, phase: 2 do | fx |
    with_fx :distortion do
      play r.tick, sustain: 2, pan: 1
      play r[look + 2], sustain: 2, pan: -1
      sleep 1
      control fx, phase: 0.5
      sleep 1
    end
  end
end

live_loop :drums do
  sample :drum_bass_hard, on: pattern('x-xx')
  sample :drum_snare_hard, on: pattern('x---')
  sample :drum_snare_soft, on: pattern('-xxx')
  sleep 0.25
end

live_loop :ticks do
  density rrand_i(1, 3) * 2 do
    sample :drum_cymbal_closed, on: one_in(2)
    sleep 0.5
  end
  sleep 0.5
end

dens = (ring 1,1,1,4)
next_dens = (knit 1, 8, 2, 3, 4, 2, 8, 1).shuffle.ring

notes = (ring 40, 42, 40, 48)
live_loop :notes do
  with_fx :reverb do
    note = notes.tick
    density dens.look do
      synth :prophet, note: note, sustain: 1.6, amp: 0.6, attack: 0, release: 0.2
      sleep 2
    end
    dens = next_dens if look == 3
  end
end

def pattern(p)
  return p.ring.tick(p) == 'x'
end
