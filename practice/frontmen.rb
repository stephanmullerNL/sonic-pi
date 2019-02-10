use_bpm 140

live_loop :wub do
  sample :bd_haus
  with_fx :wobble, phase: 0.25, mix: 1 do
    with_fx :slicer, mix: 0.9, phase: 0.5, pulse_width: 0.25, phase_offset: 0 do
      with_fx :lpf, cutoff: 90 do
        synth :dsaw, note: :a2, attack: 0, sustain: 0.95, decay: 0,
          release: 0, pitch: -10
      end
    end
  end
  sleep 1
end
