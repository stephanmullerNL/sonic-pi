

live_loop :beat do
  sample :bd_klub
  sleep 0.5
end

live_loop :jungle, sync: :beat do
  sample :loop_safari, amp: 1
  sleep 4
end

live_loop :jongle, sync: :beat do
  sample :loop_safari, rate: 0.5, amp: rrand_i(1, 4)
  sleep 9
end

live_loop :twang, sync: :beat do
  sample :elec_twang, beat_stretch: 1
  sleep 1
end

live_loop :foxy, sync: :beat do
  randy = (2 ** rrand_i(1, 4))
  with_fx [:panslicer, :ixi_techno].choose, phase: randy / 16.0 do
    sample :bass_voxy_c, amp: 0.7
    sleep 4
  end
end
