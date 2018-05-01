ambi = [:ambi_choir, :ambi_dark_woosh, :ambi_drone,
        :ambi_glass_hum, :ambi_glass_rub, :ambi_haunted_hum,
        :ambi_lunar_land, :ambi_piano, :ambi_sauna,
        :ambi_soft_buzz, :ambi_swoosh]

bass = [:bass_dnb_f, :bass_drop_c, :bass_hard_c,
        :bass_hit_c, :bass_thick_c, :bass_trance_c,
        :bass_voxy_c, :bass_voxy_hit_c, :bass_woodsy_c]

bd = [:bd_808, :bd_ada, :bd_boom, :bd_fat, :bd_gas,
      :bd_haus, :bd_klub, :bd_mehackit, :bd_pure,
      :bd_sone, :bd_tek, :bd_zome, :bd_zum]

drum = [:drum_bass_hard, :drum_bass_soft, :drum_cowbell,
        :drum_cymbal_closed, :drum_cymbal_hard, :drum_cymbal_open,
        :drum_cymbal_pedal, :drum_cymbal_soft, :drum_heavy_kick,
        :drum_roll, :drum_snare_hard, :drum_snare_soft,
        :drum_splash_hard, :drum_splash_soft, :drum_tom_hi_hard,
        :drum_tom_hi_soft, :drum_tom_lo_hard, :drum_tom_lo_soft,
        :drum_tom_mid_hard, :drum_tom_mid_soft]

elec = [:elec_beep, :elec_bell, :elec_blip, :elec_blip2,
        :elec_blup, :elec_bong, :elec_chime, :elec_cymbal,
        :elec_filt_snare, :elec_flip, :elec_fuzz_tom,
        :elec_hi_snare, :elec_hollow_kick, :elec_lo_snare,
        :elec_mid_snare, :elec_ping, :elec_plip, :elec_pop,
        :elec_snare, :elec_soft_kick, :elec_tick, :elec_triangle,
        :elec_twang, :elec_twip, :elec_wood]

all_samples = ambi + bass + bd + drum  + elec
samples = elec

live_loop :samples do
  current = samples.tick
  4.times do
    sample current, amp: 4
    sleep sample_duration current
  end
end