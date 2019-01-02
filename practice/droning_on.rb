use_bpm 120

live_loop :drone do
  density 1 do
    with_fx :gverb, release: 4, amp: 0.5, room: 1 do
      play_chord [50, 63, 75], attack: 0, release: 0, sustain: 4, pitch: rrand_i(-1, 1)
    end
    with_fx :octaver, amp: 0.3 do
      synth :prophet, attack: 4, sustain: 5, release: 4, note: rrand_i(40, 45)
    end
    sleep 8
  end
end

live_loop :tring do
  with_fx :panslicer, phase: 0.25, phase_offset: 0.25 do
    with_fx :bitcrusher, bits: 4, amp: 0.3 do
      sample :ambi_glass_rub, rate: 0.5, pitch: rrand_i(-6, -3), release: 6, sustain: 0
      sleep 16
    end
  end
end

live_loop :clicks do
  dens = (ring 1, 1, 2, 3, 2, 1, 2, 5).tick
  density dens do
    sample :drum_snare_hard, amp: 0.5, rate: 3, cutoff: 120
    sleep 3
  end
  sleep 1
end


live_loop :lunar do
  sample :ambi_lunar_land, rate: -1
  sleep 32 + 8 * rrand_i(1, 4)
end

live_loop :beat do
  sample :bd_haus, compress: 1
  sample :drum_bass_hard, hpf: 100, on: pattern('x-x-')
  sleep 0.5
  sample :drum_bass_hard, hpf: 100
  sleep 0.5
end
