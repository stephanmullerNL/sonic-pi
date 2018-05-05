# 01. closure

### DRONE

drone_fx_list = [:flanger, :slicer, :pan].ring
drone_fx = :pan

live_loop :drones do
  stop if tick > 50
  with_fx drone_fx do
    with_fx :reverb, room: 0.7 do
      sample :ambi_drone, sustain: 2, release: 2
    end
  end
  sleep 4
end

sleep 8

live_loop :dronefx do
  drone_fx = drone_fx_list.tick
  sleep 32
end

### DRUMS

buildup = (ramp *range(0, 2, 0.02))
dens = (knit 4, 1, 1, 7, 3, 1, 1, 7).ring

live_loop :kick do
  stop if tick > 400
  density dens.look do
    with_fx :slicer, phase: 0.1 do
      with_fx :distortion, distort: 0.8 do
        sample :bd_klub, amp: buildup.look, rate: 3, hpf: 70
      end
    end
    sleep 0.5
  end
end

sleep 24

### MORE DRUMS

live_loop :beat, sync: :kick do
  stop if tick > 108
  sample :loop_breakbeat, beat_stretch: 2, pre_amp: 3
  sleep 2
end

sleep 32

### PARTY

theme = [67, 48, 28, 60, 67, 48, 28, 59, 55, 52, 36, 43, 40, 24, 64, 31]
emeht = [64, 56, 47, 68, 44, 59, 52, 64, 56, 47, 71, 40, 68, 44, 59, 52]

define :play_melody do | notes, treshold, times, pitch = 0 |
  times.times do
    with_fx :octaver, mix: 0.5 do
      with_fx :distortion, distort: 0 do
        with_synth :piano do
          notes.each do | note |
            play note, release: 0.125, pitch: pitch, on: note > treshold && tick(:skip4) > 3
            sleep 0.125
          end
        end
      end
    end
  end
end

melodies = [
  [theme, 59, 4],
  [theme, 54, 12],
  [theme, 54, 4, -8],
  [theme, 54, 4],
  [theme, 42, 8],
  [theme, 42, 4, 8],
  [theme, 42, 4],
  [theme, 20, 8],
  [theme, 20, 4, -8],
  [theme, 54, 4],
  [theme, 20, 8],
  [emeht, 40, 2],
  [theme, 20, 14],
]

melodies.each do | melody |
  play_melody *melody
end
