chords = (ring
          (chord :c4, :major),
          (chord :f4, :major),
          (chord :g4, :major),
          (chord :a4, :minor),
          (chord :g4, :major),
          (chord :g4, :minor),
          (chord :f4, :major),
          (chord :d4, :minor)
          )

live_loop :music do
  len = [1, 1, 1.5, 1.5, 1.5, 2].choose
  with_synth :prophet do
    play chords.tick, attack: 0.05, sustain: (0.1 * len), release: 0.2
    sleep 0.25 * len
  end
end

live_loop :drumz do
  sample :bd_klub
  tick_reset
  7.times do
    sample :drum_snare_soft, on: tick % 2
    tick_reset(:hihat)
    density [1, 1, 1, 3].choose do
      hihat_vol = tick(:hihat) > 1 ? 0.25 : 0.5
      sample :drum_cymbal_closed, amp: hihat_vol
      sleep 0.5
    end
  end
end