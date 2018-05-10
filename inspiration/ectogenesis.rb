#Animals as Leaders - Ectogenesis

use_bpm 92

notes =  [30, 30, 33, 30, 32, 30, 35, 30, 33, 30, 37, 33, 30, 35, 32, 30].ring
chimes = [14, 16, 26, 27, 30, 41, 43, 46, 56, 57, 59, 61, 62, 64]
drums =  [56, 57, 59, 61, 62, 64]

live_loop :bassline do
  synth :fm, note: notes.tick + 12, release: 0, attack: 0, sustain: 0.15, amp: 2
  sleep 0.2
end

live_loop :intro do
  tick
  with_fx :bitcrusher do
    with_fx :distortion do
      sample :ambi_choir, attack: 0, sustain: 0.1, release: 0.1, on: (chimes.include? look + 1), start: 0.1
    end
  end
  sample :drum_snare_hard, on: (drums.include? look + 1)
  sleep 0.2
  ##| tick_reset if look > 64
end

sleep 12.8

live_loop :drums do
  sample :drum_bass_hard, amp: 2, on: (pattern('x-----x--------x') && (tick + 1) % 32)
  sample :drum_snare_hard, on: pattern('--------x-------')
  sample :drum_cymbal_closed, on: pattern('xx-x-xxx-xx-xx-x')
  sleep 0.2
end




def pattern(p)
  return p.ring.tick(p) == 'x'
end
