live_loop :rave do
  with_fx :ixi_techno do
    with_fx :octaver do
      with_fx :distortion do
        with_fx :pitch_shift, pitch: 0, amp: 0.5 do
          use_synth :tb303
          play :e1, sustain: 0.125, release: 0
          sleep 0.125
          play :d2, sustain: 0.125, release: 0
          sleep 0.125
          play :e2, sustain: 0.125, release: 0
          sleep 0.125
          play :e1, sustain: 0.25, release: 0
          sleep 0.125
        end
      end
    end
  end
end

live_loop :tick do
  sample :drum_cymbal_closed, amp: 0.3
  sleep 0.25
end

live_loop :drums do
  dens = (knit 1, 7, 2, 1).tick
  density dens do
    sample :bd_tek
    sleep 0.5
  end
end