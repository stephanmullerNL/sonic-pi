all_synths = [:beep, :blade, :bnoise, :chipbass, :chiplead,
              :chipnoise, :cnoise, :dark_ambience, :dpulse,
              :dsaw, :dtri, :dull_bell, :fm, :gnoise, :growl,
              :hollow, :hoover, :mod_beep, :mod_dsaw, :mod_fm,
              :mod_pulse, :mod_sine, :mod_tri, :noise, :piano,
              :pluck, :pnoise, :pretty_bell, :prophet, :pulse,
              :saw, :sine, :square, :subpulse, :supersaw,
              :tb303, :tech_saws, :tri, :zawa]

notes = (chord :c3, :major).ring

live_loop :all do
  use_synth all_synths.tick
  8.times do |x|
    play notes[x]
    sleep 0.3
  end
end