
amp = range(0, 1, 0.1).ramp

12.times do | x |
  sample :drum_bass_hard, amp: amp[x]
  sleep 0.125
  3.times do
    sample :drum_bass_soft, amp: amp[x]
    sleep 0.125
  end
end

16.times do
  with_fx :reverb do
    sample :drum_bass_hard
    sleep 0.125
  end
end
32.times do
  with_fx :reverb do
    sample :drum_bass_hard
    sleep 0.125 / 2.0
  end
end
sleep -0.125 / 2.0
sample :drum_splash_hard