
with_fx :reverb, room: 0.8 do
  live_loop :wub do
    with_fx :slicer, phase: 0.3, phase_offset: 0.2, wave: 0, invert_wave: 0 do
      with_synth :fm do
        play :d1, amp: 4, attack: 0, sustain: 1, divisor: 0.5, depth: 6, release: 1, lpf: 100
        sleep 2
      end
    end
    
    with_fx :slicer, phase: 0.3, phase_offset: 0.4, wave: 1, invert_wave: 1 do
      with_synth :fm do
        play :e1, amp: 4, attack: 0, sustain: 1, divisor: 0.3, depth: 5, release: 1
        sleep 2
      end
    end
  end
end
