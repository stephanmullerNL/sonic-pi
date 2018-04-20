ambi = [:ambi_choir, :ambi_dark_woosh, :ambi_drone,
        :ambi_glass_hum, :ambi_glass_rub, :ambi_haunted_hum,
        :ambi_lunar_land, :ambi_piano, :ambi_sauna,
        :ambi_soft_buzz, :ambi_swoosh]

bass = [:bass_dnb_f, :bass_drop_c, :bass_hard_c,
        :bass_hit_c, :bass_thick_c, :bass_trance_c,
        :bass_voxy_c, :bass_voxy_hit_c, :bass_woodsy_c]

samples = bass

live_loop :samples do
  current = samples.ring.tick
  sample current
  sleep sample_duration current
end