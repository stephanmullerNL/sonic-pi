# from https://www.reddit.com/r/SonicPi/comments/6s6t93/run_this_code_it_sounds_really_cool/
use_bpm 120

with_fx :reverb do
  with_fx :bitcrusher, bits: 4 do
    live_loop :bd do
      sample :bd_haus
      sleep 1
    end
    
    live_loop :snare do
      sync  :bd
      sleep 1
      sample :sn_zome
      sleep 2
      sample :sn_zome
    end
    
    live_loop :cym do
      sync :bd
      sleep 0.5
      sample :drum_cymbal_closed
      sleep 1
      sample :drum_cymbal_pedal
      sleep 0.5
    end
  end
end
