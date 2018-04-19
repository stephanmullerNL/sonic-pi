
use_random_seed 61231


buildup = (ramp *range(0, 1, 0.01))
dens = (knit 4, 1, 1, 7, 3, 1, 1, 7).ring
live_loop :kick, sync: :beat do
  tick
  density dens.look do
    with_fx :slicer, phase: 0.1 do
      with_fx :distortion, distort: 0.8 do
        sample :bd_klub, amp: buildup.look * 2, rate:3, hpf: 70
        sleep 0.5
      end
    end
  end
end

chords = (chord :c2, :major, num_octaves: 3).shuffle.take(8)
live_loop :music do
  32.times do
    with_fx :bitcrusher, bits: 8 do
      with_synth :dsaw do
        play chords.tick, release: 0.125, lpf: 80, hpf: 110
        sleep 0.125
      end
    end
  end
end

live_loop :beat do
  with_fx :flanger, phase:2 do
    sample :loop_breakbeat, beat_stretch: 2, amp: 3
    sleep 2
  end
end

live_loop :drones do
  dur = sample_duration :ambi_drone
  with_fx :reverb, room: 0.7 do
    sample :ambi_drone
    sleep dur
  end
end

