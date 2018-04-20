all_synths = [:beep, :blade, :chipbass, :chiplead,
              :dark_ambience, :dpulse, :dsaw, :dtri,
              :dull_bell, :fm, :growl, :hollow, :hoover,
              :mod_beep, :mod_dsaw, :mod_fm, :mod_pulse,
              :mod_sine, :mod_tri, :noise, :piano, :pluck,
              :pretty_bell, :prophet, :pulse, :saw, :sine,
              :square, :subpulse, :supersaw, :tb303,
              :tech_saws, :tri, :zawa,
              :bnoise, :chipnoise, :cnoise, :gnoise, :pnoise
              ]

notes = (chord :c3, :major).shuffle.ring

live_loop :all do
  current_synth = all_synths.tick
  random_synth = all_synths[rrand(1, all_synths.length)]
  8.times do |x|
    use_synth current_synth
    play notes[x]
    use_synth random_synth
    play notes[x]
    sleep 0.5
  end
end