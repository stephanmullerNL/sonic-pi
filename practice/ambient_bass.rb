r = (scale :c1, :augmented)

live_loop :dumm do
  with_fx :slicer, phase: 2 do | fx |
    with_fx :distortion do
      play r.tick, sustain: 2, pan: 1
      play r.choose, sustain: 2, pan: -1
      sleep 1
      control fx, phase: 0.5
      sleep 1
    end
  end
end
