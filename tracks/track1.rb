
use_random_seed 3003001

### DRONE

drone_fx = :pan

live_loop :drones do
  with_fx drone_fx do
    with_fx :reverb, room: 0.7 do
      sample :ambi_drone, sustain: 2, release: 2
      sleep 4
    end
  end
end

### DRUMS

buildup = (ramp *range(0, 2, 0.02))
dens = (knit 4, 1, 1, 7, 3, 1, 1, 7).ring
live_loop :kick do
  tick
  density dens.look do
    with_fx :slicer, phase: 0.1 do
      with_fx :distortion, distort: 0.8 do
        sample :bd_klub, amp: buildup.look, rate:3, hpf: 70
        sleep 0.5
      end
    end
  end
end

##| sleep 32

live_loop :beat, sync: :kick do
  with_fx :flanger, phase:2 do
    # TODO: fix distortion
    sample :loop_breakbeat, beat_stretch: 2, pre_amp: 3
    sleep 2
  end
end

drone_fx = :slicer

##| sleep 32


chords = (chord :e2, :major, num_octaves: 3).shuffle.take(16)


melody = []
melodies = (ramp
            [67, 64, 43, 48, 52, 60, 40, 36],
            [67, 48, 28, 60, 55, 52, 36, 43, 40, 24, 64, 31, 67, 48, 28, 60],
            chords
            )

live_loop :melody do
  melody = melodies.tick.ring
  16.times {puts melody}
  sleep melody.length
end

live_loop :music, sync: :kick do
  tick
  with_fx :bitcrusher, bits: 8 do
    with_synth :dsaw do
      play melody.look, release: 0.125, lpf: 105, hpf: 110
      sleep 0.125
    end
  end
end




