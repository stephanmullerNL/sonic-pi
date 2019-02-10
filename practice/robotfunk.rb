use_bpm 140

live_loop :psy do
  with_fx :wobble, phase: 0.25, mix: 1, filter: 0,
  cutoff_min: 80, cutoff_max: 110, res: 0.4, wave: 0 do
    with_fx :krush, mix: 0.7 do
      with_fx :slicer, mix: 1, phase: 0.25 do
        synth :saw, note: (ring :g3, :b3, :d3, :c3).tick, attack: 0, sustain: 0.5, decay: 0.25,
          release: 0.25, pitch: -10, decay_level: 0.2    end
    end
  end
  sleep 1
end

live_loop :drum do
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :bd_klub
  sleep 0.5
end

live_loop :ticks do
  sample :drum_cymbal_closed, on: pattern('xx-xxx--xx-x-xx-')
  sleep 0.25
end
