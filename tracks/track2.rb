use_bpm 70

live_loop :beat do
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_bass_hard
end

notes = (knit :d2, 4, :f2, 3, :e2, 1).ring

live_loop :doop, sync: :beat do
  with_fx :distortion do
    with_fx :flanger do
      use_synth :dsaw
      play notes.tick, release: 0.20, attack: 0, cutoff: 60
      sleep 0.5
    end
  end
end

sleep 16

live_loop :crash do
  with_fx :krush, res: 0.7 do
    sample :drum_cowbell, cutoff: 90, amp: cow_amp
    sleep 4
  end
end

live_loop :drums, sync: :beat do
  sleep 0.25
  sample :drum_snare_hard
  sleep 0.25
  sample :drum_snare_soft
  sleep 0.25
end

sleep 16
s = ((knit :rest, 5)  + [63, 67, 60] + (knit :rest, 8)).ring

live_loop :blips, sync: :beat do
  with_fx :distortion, distort: 0.2 do
    with_fx :bitcrusher do
      with_synth :prophet do
        play s.tick, release: 0.125
        sleep 0.25
      end
    end
  end
end

sleep 16
