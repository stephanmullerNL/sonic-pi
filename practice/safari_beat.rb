beat_dens = (knit 1, 15, 2, 1, 1, 15, 3, 1).ring

live_loop :industry do
  sample :loop_industrial, beat_stretch: 1, lpf: 120, attack: 0.1, amp: 0.8
  sleep 1
end

live_loop :beat, sync: :industry do
  tick
  density beat_dens.look do
    sample :bd_haus, amp: 2, cutoff: 90, on: (ring 1,0,0,1,1,0,0,1).look
    sleep 0.25
  end
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

