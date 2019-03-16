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

bar = [1, 1, 1.5, 1.5, 2]

live_loop :music do
  with_synth :fm do
    with_fx :flanger, mix: 0.2 do
      len = bar.shuffle.ring.tick(:bar)
      play chords.tick(:chord), attack: 0.05, sustain: (0.1 * len), release: 0.2
      sleep 0.25 * len
    end
  end
end

live_loop :drumz do
  sample :bd_klub
  tick_reset
  5.times do
    sample :drum_snare_soft, on: tick % 2, hpf: 100
    sample :bd_sone, on: rrand_i(1, 4) > 3, rate: -1
    tick_reset(:hihat)
    density [1, 1, 1, 3].choose do
      hihat_vol = tick(:hihat) > 1 ? 0.25 : 0.5
      sample :drum_cymbal_closed, amp: hihat_vol, cutoff: 100
      sleep 0.5
    end
  end
end

live_loop :effect do
  with_fx :bitcrusher, bits: 4 do
    with_fx :slicer do
      sleep 7
      sample :guit_e_fifths, rate: rrand(0.2, 0.5), sustain: 1, start: rrand(0, 1)
    end
  end
end
