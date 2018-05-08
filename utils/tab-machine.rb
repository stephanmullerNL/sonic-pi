use_bpm 100

# INSTRUMENTS
bass = :drum_bass_hard
cymbal = :drum_cymbal_open
hihat = :drum_cymbal_closed
snare = :drum_snare_hard
tom1 = :drum_tom_hi_hard
tom3 = :drum_tom_lo_hard

# TABS
tabs = "
 S:|----o--o-o--o---|----o--o-o--o---|----o--o-o--o---|----o--o-o--o---|
 B:|o--o----o-oo--o-|o--o----o-oo--o-|o--o----o-oo--o-|o--o----o-oo--o-|

 C:|X---------------|X---------------|X---------------|X---------------|
HH:|----o---o---o---|----o---o---o---|----o---o---o---|----o---o-------|
 S:|----o--o-o--o---|----o--o-o--o---|----o--o-o--o---|----o-----oooooo|
 B:|o--o----o-oo--o-|o--o----o-oo--o-|o--o----o-oo--o-|o--o--o-o-------|"

define :drum do | instrument, note |
  sample instrument if note && note != '-'
end

def parse(tabs)
  return tabs.split(/\n/)
  .select { | item | item.length > 0 }
  .map { | str | str.strip || str }
  .inject (Hash.new('')) do | all, current |
    char, rest = current.split(':')
    puts all, char, rest
    all[char] += rest
    all
  end
end

tabs = parse(tabs)

puts tabs

live_loop :machine do
  tick
  drum bass, tabs['B'].tr('|', '')[look]
  drum cymbal, tabs['C'].tr('|', '')[look]
  drum hihat, tabs['HH'].tr('|', '')[look]
  drum snare, tabs['S'].tr('|', '')[look]
  drum tom1, tabs['T'].tr('|', '')[look]
  drum tom3, tabs['FT'].tr('|', '')[look]
  sleep 0.25
  tick_reset if look > tabs['B'].length
end
