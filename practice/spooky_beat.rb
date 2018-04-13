sample :loop_garzul, attack: 4

sleep 8

live_loop :beat do
  sample :loop_garzul
  sleep 8
end

live_loop :random do
  use_synth :mod_saw
  
  play rrand_i(50, 80), amp: rrand(0.1, 0.6), pan: rrand(-1, 1)
  sleep 0.25
end

