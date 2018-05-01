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

sleep 8

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

sleep 32

live_loop :beat, sync: :kick do
  sample :loop_breakbeat, beat_stretch: 2, pre_amp: 3
  sleep 2
end

drone_fx = :slicer

sleep 32

drone_fx = :pan

intro = [67, 64, 43, 48, 52, 60, 40, 36]
theme =  [67, 48, 28, 59, 55, 52, 36, 43, 40, 24, 64, 31, 67, 48, 28, 60]
emeht = [44, 59, 52, 64, 56, 47, 71, 40, 68, 44, 59, 52, 64, 56, 47, 68]
up = lambda {|n| n + 8}
down = lambda {|n| n - 8}

melodies = [
  intro, 20, 8,
  theme, 59, 24,
  theme.map(&up), 59, 8,
  theme, 54, 24,
  theme.map(&down), 46, 8,
  theme, 54, 8,
  theme, 42, 16,
  theme.map(&up), 50, 8,
  theme, 42, 8,
  theme, 20, 16,
  theme.map(&down), 20, 8,
  theme, 59, 8,
  theme, 20, 16,
  emeht, 40, 4,
  theme, 20, 28
]

melody = 0
treshold = 0

live_loop :melody do
  # todo: refactor
  melody = melodies.tick.ring
  treshold = melodies.tick
  sleep melodies.tick
end

live_loop :music, sync: :kick do
  tick
  with_fx :octaver, mix: 0.5 do
    with_fx :distortion, distort: 0 do
      with_synth :piano do
        play melody.look, release: 0.125, on: melody.look > treshold
        sleep 0.125
      end
    end
  end
end




