notes =  (ring :C3, :Cs3, :Cb3, :D3, :Ds3, :Db3, :E3, :Es3, :Eb3, :F3, :Fs3, :Fb3)
times = (knit 0.3, 3, 0.1, 3).ring

live_loop :notes do
  with_synth :prophet do
    tick
    play notes.look, amp: 5, release: times.look * 2
    sleep times.look
  end
end