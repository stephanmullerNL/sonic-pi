# 02. promise

use_bpm 70

### DRUMS

live_loop :beat do
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_bass_hard
end

### BASS
bass = (knit :d2, 4, :f2, 3, :e2, 1).ring

live_loop :doop, sync: :beat do
  with_fx :distortion do
    with_fx :flanger do
      use_synth :dsaw
      play bass.tick, release: 0.20, attack: 0, cutoff: 60
      sleep 0.5
    end
  end
end

sleep 16

### BELL

live_loop :crash do
  with_fx :krush, res: 0.7 do
    sample :drum_cowbell, cutoff: 90, amp: 1
    sleep 4
  end
end

### MORE DRUMS

live_loop :drums, sync: :beat do
  sleep -0.25
  11.times do
    sleep 0.25
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_snare_soft
    sleep 0.25
  end
end

sleep 16

### MELODY

blips = (ring 63, 67, 60)

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


chitz = (ring 63, 62, 67, 61, 0, 65, 0, 0, 62, 66, 67, 65, 0, 61, 0, 0)
chitz_volumes = [
  [1, 1],
  [1, 0],
  [0, 0],
  [0, 1],
  [1, 1],
  [0, 1],
  [1, 0],
  [0, 0]
]

live_loop :chitz, sync: :beat do
  use_synth :dsaw
  
  8.times do
    vol1, vol2 = chitz_volumes.tick(:volume)
    
    32.times do
      tick
      play chitz.look, release: 0.2, cutoff: 80, amp: 0.5 * vol1
      sample :elec_bong, rpitch: chitz.look - 60, amp: 1 * vol2
      sleep 0.25
    end
  end
end
