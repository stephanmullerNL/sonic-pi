use_bpm 140

live_loop :psy do
  sample :bd_haus, amp: 2
  with_fx :wobble, phase: 0.25, mix: 1, filter: 0,
  cutoff_min: 80, cutoff_max: 110, res: 0.4, wave: 0 do
    with_fx :slicer, mix: 1, phase: 0.25 do
      synth :saw, note: :a2, attack: 0, sustain: 0.5, decay: 0.25,
        release: 0.25, pitch: -10
    end
  end
  sleep 1
end

