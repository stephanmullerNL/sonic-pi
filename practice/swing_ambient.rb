# Welcome to Sonic Pi
swing_beat = (ring 1,0,0,1,0,1)
swing_amp = (range 0.3, 0.9, 0.01) + (range 0.9, 0.3, 0.01)

live_loop :swing do
  tick
  sample :drum_cymbal_soft, on: swing_beat.look, amp: swing_amp.look
  sample :drum_cymbal_closed, on: look % 4
  sample :bd_tek, on: look % 3 == 0
  sleep 0.15
end

melody = (ring :E3, :B3, :E3, :A3)
densities = (ring 1, 2, 1, 1, 1, 3, 1, 2, 1)
live_loop :bass, sync: :swing do
  tick
  tone = melody.look
  dens = densities.look
  4.times do
    density dens do
      play_chord chord(tone, :minor)
      sleep 0.6
    end
  end
end
