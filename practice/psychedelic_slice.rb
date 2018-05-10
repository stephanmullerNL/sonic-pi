
s = '~/s/FX/'

live_loop :noice do
  with_fx :slicer, phase: 0.15 do
    sample s, 4, rate: 0.5, finish: 0.4
    sleep 4
  end
end
