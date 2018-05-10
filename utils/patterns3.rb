def with_pattern(pattern, &block)
  block.call(pattern.ring.tick == 'x')
end

live_loop :tick do
  with_pattern 'xx-xx-xx-xxx-xxx' do | x |
    sample :drum_bass_hard, on: x
    sample :drum_cymbal_closed, on: x
    sleep 0.25
  end
end

live_loop :bass do
  with_pattern '--x-' do | x |
    sample :drum_snare_hard, on: x
    sleep 0.25
  end
end