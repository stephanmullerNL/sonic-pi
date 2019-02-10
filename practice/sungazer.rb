use_bpm 100

live_loop :drums do
  sample :drum_cymbal_closed
  sleep 0.2
  sample :drum_cymbal_closed
  sleep 0.2
  sample :drum_snare_soft, amp: 1.5
  sleep 0.4
  if (tick % 4 == 0) then
    density 1 do
      sample :drum_snare_soft
      sleep 0.4
    end
  end
end

chords = (ring
          (chord :a3, :major),
          (chord :c4, :minor),
          (chord :b3, :major),
          (chord :d3, :major)
          )

live_loop :bass do
  c = chords.tick
  play c, sustain: 0.2, attack: 0, release: 0
  sleep 0.4
  if (look % 8 == 0) then
    play c
    sleep 0.4
  end
end

live_loop :zumm do
  play (chord :b2, '+5'), sustain: 0.8, pitch: rrand_i(-1, 1), attack: 0, release: 0
  sleep 2
  play (chord :b2, '+5'), sustain: 0.6, pitch: rrand_i(-1, 1), attack: 0, release: 0
  sleep 1.6
end