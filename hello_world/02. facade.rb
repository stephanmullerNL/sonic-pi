# 02. facade

s = 1
use_bpm 70
last = 320

### DRUMS

live_loop :beat do
  stop if tick >= last
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_bass_hard
end

### BASS

bass = (knit :d2, 4, :f2, 3, :e2, 1).ring

live_loop :doop, sync: :beat do
  stop if tick >= last + 16
  with_fx :distortion do
    with_fx :flanger do
      use_synth :dsaw
      play bass.look, release: 0.20, attack: 0, cutoff: 60
      sleep 0.5
    end
  end
end

sleep 16 * s

### BELL

live_loop :bell do
  stop if (tick) * 16 > last
  with_fx :krush, res: 0.7 do
    sample :drum_cowbell, cutoff: 90, amp: 1
  end
  sleep 8
end

### MORE DRUMS

live_loop :drums, sync: :beat do
  stop if (tick + 2) * 16 >= last
  sleep -0.25
  11.times do
    sleep 0.25
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_snare_soft
    sleep 0.25
  end
end

sleep 16 * s

### MELODY

blips = (ring 67, 60, 63, 60, 63, 67)

live_loop :blips, sync: :beat do
  stop if (tick) * 16 >= last
  with_fx :distortion, distort: 0.2 do
    with_fx :bitcrusher do
      with_synth :prophet do
        
        sleep 1.25
        
        3.times do
          play blips.tick(:blip), release: 0.125
          sleep 0.25
        end
        
        sleep 2
      end
    end
  end
end

sleep 16 * s

chitz = (ring 63, 62, 67, 61, 0, 65, 0, 0, 62, 66, 67, 65, 0, 61, 0, 0)
chitz_volumes = [
  [1, 1],
  [1, 0],
  [0, 0],
  [0, 1],
  [1, 1],
  [0, 0],
  [1, 1],
  [1, 0],
  [0, 0],
  [0, 1],
  [1, 1],
  [0, 0]
].ramp

live_loop :human_music, sync: :beat do
  use_synth :dsaw
  bip, bop = chitz_volumes.tick(:volume)
  
  32.times do
    tick
    play chitz.look, release: 0.2, cutoff: 80, amp: 0.5, on: bip
    sample :elec_bong, rpitch: chitz.look - 60, on: bop
    sleep 0.25
  end
end

sleep 64 * s

### GAME OVER

def roy(note, distort, wobble, invert, whammy)
  use_synth :dsaw
  with_fx :distortion, mix: distort do
    with_fx :wobble, phase: 0.2, invert_wave: invert, mix: wobble do
      with_fx :whammy, deltime: 0, mix: whammy do
        density 2 do
          play_chord (scale note, :hex_major6),
            sustain: 0.2, attack: 0, release: 0,
            cutoff: 90
          sleep 0.5
        end
      end
    end
  end
end

roys = [
  [0, 1, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 1, 0, 0],
  [0, 1, 1, 0],
  [1, 1, 1, 0],
  [1, 0, 0, 1],
  [0, 1, 1, 0],
  [0, 1, 1, 0],
]

live_loop :roy, sync: :beat do
  args = roys.tick
  stop if look >= 13
  8.times do | x |
    roy(bass[x], *args)
  end
end