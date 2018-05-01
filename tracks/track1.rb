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

##| sleep 8

### DRUMS

buildup = (ramp *range(0, 2, 0.02))
dens = (knit 4, 1, 1, 7, 3, 1, 1, 7).ring

live_loop :kick do
  tick
  density dens.look do
    with_fx :slicer, phase: 0.1 do
      with_fx :distortion, distort: 0.8 do
        sample :bd_klub, amp: buildup.look, rate: 3, hpf: 70
        sleep 0.5
      end
    end
  end
end

##| sleep 32

live_loop :beat, sync: :kick do
  sample :loop_breakbeat, beat_stretch: 2, pre_amp: 3
  sleep 2
end

drone_fx = :slicer

##| sleep 32

use_random_seed 1343
chords = (chord :e2, :major, num_octaves: 3).shuffle.take(16)

melodies = [
  [67, 64, 43, 48, 52, 60, 40, 36], 8,
  [67, 48, 28, 60, 55, 52, 36, 43, 40, 24, 64, 31, 67, 48, 28, 60], 32,
  [75, 56, 36, 68, 63, 60, 44, 51, 48, 32, 72, 39, 75, 56, 36, 68], 8,
  [67, 48, 28, 60, 55, 52, 36, 43, 40, 24, 64, 31, 67, 48, 28, 60], 24,
  [59, 40, 20, 52, 47, 44, 28, 35, 32, 16, 56, 23, 59, 40, 20, 52], 8,
  [67, 48, 28, 60, 55, 52, 36, 43, 40, 24, 64, 31, 67, 48, 28, 60], 24,
  [44, 59, 52, 64, 56, 47, 71, 40, 68, 44, 59, 52, 64, 56, 47, 68], 8
]

melody = melodies[0].ring

live_loop :melody do
  melody = melodies.tick.ring
  sleep melodies.tick
end

live_loop :music, sync: :kick do
  tick
  with_fx :octaver, mix: 0.5 do
    with_fx :distortion, distort: 0 do
      with_synth :piano do
        play melody.look, release: 0.125
        sleep 0.125
      end
    end
  end
end




