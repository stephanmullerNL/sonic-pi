use_bpm 90
r = chord :c3, :minor, num_octaves: 2

live_loop :ladder, sync: :drum do
  with_fx :slicer, phase: 0.25, pulse_width: 0.25 do
    with_synth :sine do
      play r.choose, release: 4, pitch: 1
      ##| play :c4, release: 4
      sleep 2
    end
  end
end
