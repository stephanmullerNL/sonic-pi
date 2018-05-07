
live_loop :noise do
  with_fx :panslicer, phase: 0.5 do
    with_fx :slicer, phase: 0.125 do
      half = (sample_duration :drum_splash_hard) / 4.0
      sample :drum_cymbal_open, rate: 1, attack: half, release: half, amp: 2
      sample :drum_splash_hard, rate: 1, attack: half, release: half, amp: 2
      with_fx :flanger do
        play :g4, sustain: 2
        sleep 2
      end
    end
  end
end
