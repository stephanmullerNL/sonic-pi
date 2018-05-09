use_bpm 100
time = 0.25

tabs = "
 C:|X---------------|X---------------|X---------------|X---------------|
HH:|----o---o---o---|----o---o---o---|----o---o---o---|----o---o-------|
 S:|----o--o-o--o---|----o--o-o--o---|----o--o-o--o---|----o-----oooooo|
 B:|o--o----o-oo--o-|o--o----o-oo--o-|o--o----o-oo--o-|o--o--o-o-------|

HH:|x-x-x-x-x-x-x-x-|x-x-x-x-x-x-x-o-|x-x-x-x-x-x-x-x-|x-x-x-x-x-x-x-o-|
 S:|----o-------o---|----o-------o---|----o-------o---|----o-------o---|
 B:|o-o-----o-o-----|o-o-----o-o-----|o-o-----o-o-----|o-o-----o-o-----|
"

instruments = {
  'B' => { 'o' => :drum_bass_hard },
  'C' => { 'X' => :drum_splash_hard },
  'HH' => {
    'x' => :drum_cymbal_closed,
    'o' => :drum_cymbal_open
  },
  'S' => {
    'o' => :drum_snare_hard,
    'f' => :drum_snare_hard
  },
  'T' => { 'o' => :drum_tom_hi_hard },
  'FT' => { 'o' => :drum_tom_lo_hard }
}

# convert an array of tab lines to an object the machine can work with
def to_bar_hash(ar)
  ar.inject (Hash.new('')) do | all, current |
    char, rest = current.tr(' |', '').split(':')
    all[char] += rest
    all
  end
end

# split tabs into separate bars
def parse(tabs)
  return tabs.split(/\n/)
  .chunk {  | line | line.include? '|' }
  .select { | k, v | v[0].include? '|' }
  .map { | k, v | to_bar_hash(v) }
end

bars = parse(tabs)

bars.each do | bar |
  # Assume each line in a bar is as long as the first one
  length = bar.first[1].length
  length.times do | n |
    instruments.each do | key, sounds |
      note = bar[key][n]
      sample sounds[note]
    end
    sleep time
  end
end
