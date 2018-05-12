bla = '~/s/newshit/blabla.wav'

sections = [
  [0, 0.25],
  [0.25, 0.5],
  [0.5, 0.75],
  [0.75, 1]
].ring


live_loop :tick do
  sleep 0.03
  sample :drum_cymbal_closed, hpf: 120, lpf: 130
  sample :elec_fuzz_tom, amp: 0.3
  sample :bd_klub, amp: 0.5
  sleep (2.75 / 8.0) - 0.03
end

r = [1, 2, 3, 11, 24, 76]
live_loop :random, sync: :tick do
  with_fx :bitcrusher do
    with_fx :echo do
      sample bla, onset: r.choose
      sleep 2.75
    end
  end
end

live_loop :bla, sync: :tick do
  with_fx :pitch_shift, pitch: rrand_i(1, 5) do
    s, f = sections.tick
    sample bla, start: s, finish: f, beat_stretch: 11
    sleep 2.75
  end
end
