def pattern(p)
  return p.ring.tick(p) == 'x'
end

live_loop :thirds do
  sample :drum_bass_hard, amp: 2, on: pattern('x-x-')
  sample :drum_snare_hard, on: pattern('x-')
  sample :drum_cymbal_closed, on: pattern('xxxx')
  sleep 0.25
end

notes = [54, 55, 56, 57].ring
live_loop :beep do
  play notes.tick, release: 0.2, on: pattern('x-x-xxxx')
  sleep 0.25
end