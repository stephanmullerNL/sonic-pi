# INSTRUMENTS
bass = :drum_bass_hard
snare = :drum_snare_hard

# TABS
tabs = "
S:|o--o----o-oo--o-|o--o----o-oo--o-|o--o----o-oo--o-|o--o----o-oo--o-|
B:|----o--o-o--o---|----o--o-o--o---|----o--o-o--o---|----o--o-o--o---|"

define :drum do | instrument, note |
  sample instrument if note == 'o'
end

x = tabs.split(/\n/)
.select { | item | item.length > 0 }
.inject ({}) do | all, current |
  char, rest = current.split(':')
  puts all, char, rest
  all.update(all) { | key, val | val += rest }
  puts all
end
puts x

##| def parse(tabs)
##|   return tabs.split(/\n/)
##|   .select { | item | item.length > 0 }
##|   .inject ({}) do | all, current |
##|     char, rest = current.split(':')
##|     puts all, char, rest
##|     all.update(all) { | key, val | val += rest }
##|     puts all
##|   end
##| end

##| tabs = parse(tabs)

##| puts tabs

##| live_loop :machine do
##|   tick
##|   ##| note = tabline.tr('|', '')[look]
##|   ##| drum bass, note
##|   sleep 0.25
##| end