
s = '~/s/Drum Loops/'
live_loop :samples do
  tick
  sample s, 8, beat_stretch: 12
  sleep 12
end

live_loop :random do
  with_fx :echo do
    ons = choose
    density 2 do
      sample s, 8, onset: ons
      sleep 2
    end
  end
  sleep 4
end

