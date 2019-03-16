use_bpm 80
use_random_seed 12

snare_pattern1 = knit(1, 3, 0, 4).shuffle
snare_pattern2 = knit(1, 3, 0, 4).shuffle
snare_pattern3 = knit(1, 4, 0, 3).shuffle

snare_pattern = snare_pattern1 + snare_pattern2 + snare_pattern1 + snare_pattern3
bass_pattern = knit(1, 4, 0, 3).shuffle

live_loop :drums do
  if rrand_i(1, 32) == 4
    sp = bass_pattern
    bp = bass_pattern
    cp = bass_pattern
    dens = [1]
    mp = 2
  else
    sp = snare_pattern
    bp = bass_pattern
    cp = (ring 1)
    dens = (knit 1, 20, 2, 4, 3, 1)
    mp = 1
  end
  
  7.times do
    tick
    sample :drum_cymbal_soft, amp: mp, on: (look % 7 == 6) && mp == 2
    sample :drum_snare_hard, amp: mp, on: look % 7 == 0
    sample :drum_snare_soft, amp: mp, on: sp.look
    sample :bd_zum, rate: 0.8, amp: 0.8 * mp, cutoff: 100, on: bp.look
    
    density  dens.choose do
      sample :drum_cymbal_closed, cutoff: 120, on: cp.look
      
      sleep  2.0/7
    end
  end
end

notes = [74, 72, 70, 74, 72, 70, 66].ring
chords = [(chord :g4, :major),
          (chord :f4, :major),
          (chord :e4, :major),
          (chord :g4, :major),
          (chord :f4, :major),
          (chord :e4, :major),
          (chord :c4, :minor)].ring

live_loop :todd, sync: :drums do
  with_synth :pluck do
    ##| with_fx :octaver do
    play chords.tick
    ##| synth :pluck, note: notes.tick
    sleep 2.0/7
    ##| end
  end
end