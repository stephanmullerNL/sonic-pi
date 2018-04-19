# Copied from https://www.youtube.com/watch?v=vW9vWv_xHhg
# Around 45:00

live_loop :low do
  tick
  synth :fm, wave: 1, phase: 0.25, release: 5, note: (knit :e1, 12, :c1, 4).look
  sleep 4
end

with_fx :reverb, room: 1 do
  live_loop :lands, autocue: false do
    use_synth :dsaw
    use_random_seed 31080300
    ns = (scale :e2, :minor_pentatonic, num_octaves: 4).take(6)
    
    16.times do
      play ns.choose, detune: (octs 12, 3).tick, release: 0.1, amp: 8
      sleep 0.125
    end
    
  end
end


live_loop :tijd do
  sample :bd_haus, amp: 2.5, cutoff: 100
  sleep 0.5
end


live_loop :fietsen do
  with_fx :flanger do
    sample :guit_em9, rate: 0.25, amp: 9
  end
  sleep 8
end


live_loop :ind, sync: :fietsen do
  sample :loop_industrial, amp: 1, beat_stretch: 1, amp: 7
  sleep 1
end


live_loop :acid, sync: :ind do
  synth :tb303, note: :e1, release: 0.1, sustain: 0, cutoff: rrand(40, 90) + 31, amp: 2
  sleep 0.125
end

