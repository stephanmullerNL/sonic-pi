
use_random_seed 1231131

chords = (chord :c2, :major, num_octaves: 3).shuffle.take(16)
live_loop :music do
  sleep -0.04
  32.times do
    with_fx :bitcrusher, bits: 8 do
      with_synth :prophet do
        play chords.tick, release: 0.125
        sleep 0.125
      end
    end
  end
  sleep 0.04
end

live_loop :beat, sync: :wub do
  sample :loop_breakbeat, beat_stretch: 2, amp: 3
  sleep 2
end


buildup = (ramp *range(0, 1, 0.01))
live_loop :kick, sync: :beat do
  with_fx :distortion, distort: 0.8 do
    sample :bd_haus, amp: buildup.tick / 2
    sleep 0.5
  end
end

