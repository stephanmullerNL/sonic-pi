chords = (ring :a2, :b2, :c2, :d2, :e2, :f2, :g2).shuffle.take(4)

live_loop :env do
  with_fx :reverb, room: 0.9 do
    with_synth :dsaw do
      play_chord (chord chords.tick, :minor), release: 0.5, attack: 0.5, sustain: 0.5, decay: 0.5, attack_level: 1, sustain_level: 2, decay_level: 3
      sleep 2
    end
  end
end

live_loop :sample do
  sample :loop_breakbeat, amp: 4, beat_stretch: 2
  sleep 2
end