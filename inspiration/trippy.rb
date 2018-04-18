# Copied from https://www.youtube.com/watch?v=KJPdbp1An2s
# around 33:00

notes = (scale :e1, :major_pentatonic, num_octaves: 3)
octo = (octs, :e3, 3)

live_loop :drum do
  sample :bd_haus, amp: 4, on: (ring 1, 0, 1, 0).tick
  sleep 0.25
end

live_loop :test do
  tick_reset
  t = 0.04
  sleep -t
  ##| with_fx :krush do
  with_fx :bitcrusher, bits: 4 do
    
    s = synth :dsaw, note: :e3, sustain: 8, lpf: 120
    s2 = synth :dsaw, note: :e3, sustain: 8, lpf: 90
    64.times do
      sleep 0.125
      control s, note: notes.tick
      control s2, note: octo.look
    end
  end
  sleep t
end

live_loop :beat do
  sample :loop_industrial, beat_stretch: 1
  sleep 1
end

