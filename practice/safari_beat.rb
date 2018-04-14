live_loop :industry do
  sample :loop_industrial, beat_stretch: 1, lpf: 130, attack: 0.1
  sleep 1
end

live_loop :beat, sync: :industry do
  sample :bd_haus, amp: 2, cutoff: 80, on: (ring 1,0,0,1,1,0,0,1).tick
  sleep 0.25
end

live_loop :synth do
  sample :ambi_drone, beat_stretch: 8
  with_fx :flanger do
    with_synth :piano do
      sample :loop_safari, amp: 2, pitch: rrand(-1, 1)
    end
  end
  sleep 8
end

