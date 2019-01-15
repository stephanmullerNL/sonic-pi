live_loop :m do
  sleep 0.5
end
s = 0

live_loop :ticks, sync: :m do
  ticks = (range 1, 8) + (range 6, 2)
  spr = (spread ticks.tick, 8, rotate: rrand_i(0, 3))
  
  128.times do
    sample :drum_cymbal_closed, rate: 2, attack: 0, release: 0.2, sustain: 0,
      on: spr.tick(:spread)
    sleep 0.125
  end
end

sleep 4 * s

live_loop :drum, sync: :m do
  sample :bd_sone
  sleep 0.5
  sample :bd_zome
  sleep 0.5
end

sleep 4 * s

live_loop :synth, sync: :m do
  deg = (ring :i, :v, :vi, :iv).tick
  
  n = (chord_degree deg, 40, :major, 3)
  density 4 do
    synth :blade, note: n, sustain: 0.3, attack: 0, release: 0.2
    synth :beep, note: n, sustain: 0.3, attack: 0.2, release: 0.2, cutoff: 100
    sleep 2
  end
end
