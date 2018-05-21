# from: https://twitter.com/einfachirre/status/996869871911821314

with_bpm 60 do
  in_thread do
    loop do
      3.times do
        sample :bd_haus, amp: 2
        
        sleep 0.5
        sample :bd_haus, amp: 2
        
        with_fx :reverb do
          sample :elec_tick, amp: 2
        end
        sleep 0.5
      end
      sample :bd_haus, amp: 2
      sleep 0.5
      sample :bd_haus, amp: 2
      with_fx :gverb do
        sample :elec_tick, amp: 2
      end
      sleep 0.5
    end
  end
  in_thread do
    loop do
      with_fx :ixi_techno do
        with_fx :octaver do
          with_fx :distortion do
            use_synth :tb303
            play :e1, sustain: 0.125, release: 0
            sleep 0.125
            play :d2, sustain: 0.125, release: 0
            sleep 0.125
            play :e2, sustain: 0.125, release: 0
            sleep 0.125
            play :e1, sustain: 0.25, release: 0
            sleep 0.125
          end
        end
      end
    end
  end
  in_thread do
    loop do
      with_fx :echo do
        with_fx :panslicer do
          with_fx :flanger do
            use_synth :supersaw
            play_chord [:b4, :g4, :fs4, :e4]
            sleep 1.75
            sleep 2.5
            play_chord [:a4, :fs4, :d4, :cs4]
            #play_chord [:a4, :e4, :c4, :b3]
            sleep 4.25
          end
        end
      end
    end
  end
  in_thread do
    loop do
      sleep 6
      with_fx :echo do
        sample :elec_filt_snare
      end
      sleep 2
      
    end
  end
  in_thread do
    loop do
      with_fx :wobble do
        sleep 0.125
        sample :elec_triangle, sustain: 0.125, amp: 0.4
        sleep 0.125
        sample :elec_triangle, sustain: 0.125, amp: 0.8
        sleep 0.125
        sample :elec_triangle, sustain: 0.125, amp: 0.6
        sleep 0.125
      end
      
    end
  end
  in_thread do
    loop do
      with_fx :krush do
        with_fx :lpf do
          sample :drum_heavy_kick
          sleep 0.5
        end
      end
    end
  end
  in_thread do
    loop do
      with_fx :echo do
        with_fx :gverb do
          sample :guit_em9, amp: 1.0
          sleep 10
        end
      end
    end
  end
end