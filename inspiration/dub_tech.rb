# from: https://www.youtube.com/watch?v=a1RxpJkvqpY

use_bpm 100
cutoff = (range 50, 80, 1).mirror

bass_rythm = (ring 1,0,0,0,1,0,0,0,
              1,0,0.5,0,1,0,0.5,0)

live_loop :beat do
  with_synth :fm do
    play :d1, amp: 2 * bass_rythm.tick, attack: 0.03,
      divisor: 1, depth: 2.5
  end
  sleep 0.25
end

live_loop :wub do
  sleep 7.5
  with_fx :pan, pan: -0.5 do
    with_synth :fm do
      play :d1, attack: 0.5, divisor: 0.5, depth: 6
    end
  end
  sleep 0.5
end


