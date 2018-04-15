live_loop :beat do
  sample :ambi_choir, rate: 0.4, hpf: 70
  sample :ambi_choir, rate: 0.3, lpf: 105
  with_fx :slicer, phase: 0.25 do
    density (knit 1, 7, 4, 1).ring.tick do
      sample :ambi_choir, rate: 0.7
      sleep 0.5
    end
  end
  sample :bd_haus, rate: 0.5
end