use_bpm 70

doop = (knit :d2, 4, :f2, 3, :e2, 1).ring
blips = (ring 63, 67, 60)
chitz = (ring 63, 62, 67, 61, 0, 65, 0, 0, 62, 66, 67, 65, 0, 61, 0, 0)

16.times do
  puts chitz
end

live_loop :beat do
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_bass_hard
end

live_loop :doop, sync: :beat do
  with_fx :distortion do
    with_fx :flanger do
      use_synth :dsaw
      play notes = (knit :d2, 4, :f2, 3, :e2, 1).ring
      .tick, release: 0.20, attack: 0, cutoff: 60
      sleep 0.5
    end
  end
end

sleep 16

live_loop :crash do
  with_fx :krush, res: 0.7 do
    sample :drum_cowbell, cutoff: 90, amp: 1
    sleep 4
  end
end

live_loop :drums, sync: :beat do
  sleep 0.25
  sample :drum_snare_hard
  sleep 0.25
  sample :drum_snare_soft
  sleep 0.25
end

sleep 16

live_loop :blips, sync: :beat do
  with_fx :distortion, distort: 0.2 do
    with_fx :bitcrusher do
      with_synth :prophet do
        
        sleep 1.25
        
        3.times do
          play blips.tick, release: 0.125
          sleep 0.25
        end
        
        sleep 2
      end
    end
  end
end

sleep 16

live_loop :chitz, sync: :beat do
  chitz_vol_1 = rrand_i(0, 1)
  chitz_vol_2 = rrand_i(0, 1)
  32.times do
    tick
    with_synth :dsaw do
      play chitz.look, release: 0.2, cutoff: 80, amp: 0.5 * chitz_vol_1
      sample :elec_bong, rpitch: chitz.look - 60, amp: 1 * chitz_vol_2
      sleep 0.25
    end
  end
end
