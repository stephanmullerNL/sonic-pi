# 01. closure

### DRONE

drone_fx_list = [:flanger, :slicer, :pan].ring
drone_fx = :pan

live_loop :drones do
  stop if tick > 42
  with_fx drone_fx do
    with_fx :reverb, room: 0.7 do
      sample :ambi_drone, sustain: 2, release: 2
    end
  end
  sleep 4
end

##| sleep 7

live_loop :dronefx do
  drone_fx = drone_fx_list.tick
  sleep 24
end

##| sleep 1

### DRUMS

buildup = (ramp *range(0, 2, 0.02))
dens = (knit 4, 1, 1, 7, 3, 1, 1, 7).ring

live_loop :kick do
  stop if tick > 354
  density dens.look do
    with_fx :slicer, phase: 0.1 do
      with_fx :distortion, distort: 0.8 do
        sample :bd_klub, amp: buildup.look, rate: 3, hpf: 70
      end
    end
    sleep 0.5
  end
end

##| sleep 24

### MORE DRUMS

live_loop :beat, sync: :kick do
  stop if tick > 81
  sample :loop_breakbeat, beat_stretch: 2, pre_amp: 3, hpf: 40, lpf: 130
  sleep 2
end

##| sleep 24

### MUSIC

theme = [67, 48, 28, 60, 67, 48, 28, 59, 55, 52, 36, 43, 40, 24, 64, 31]
emeht = [64, 56, 47, 68, 44, 59, 52, 64, 56, 47, 71, 40, 68, 44, 59, 52]
use_synth :piano

define :play_melody do | notes, treshold, times, pitch = 0 |
  with_fx :octaver, mix: 0.5 do
    times.times do
      notes.each do | note |
        play note, release: 0.125, pitch: pitch, on: note > treshold
        sleep 0.125
      end
    end
  end
end

melodies = [
  [theme, 42, 12],
  [theme, 42, 2, 8],
  [theme, 42, 4],
  [theme, 20, 8],
  [theme, 20, 2, -8],
  [theme, 42, 4],
  [theme, 54, 2],
  [theme, 20, 8],
  [emeht, 40, 2],
  [theme, 20, 12],
  [emeht, 40, 4],
  [theme, 20, 14],
  [theme, 42, 1],
  [theme.take(8), 59, 1]
]

melodies.each do | melody |
  play_melody *melody
end
