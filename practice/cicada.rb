s = "~/Dev/sonic-pi/samples/tambourine.wav"

live_loop :rain do
  with_fx :distortion do
    with_fx :echo do
      with_fx :reverb, room: 0.7 do
        with_fx :slicer, phase: 0.2, wave: 1, pulse_width: 0.2  do
          sample s, pitch: 14, beat_stretch: 3
          ##| play 60, sustain: 5
          sleep 0.1
          sample s, pitch: 10
          sleep 0.1
          sample s, pitch: 18
          sleep sample_duration s
        end
      end
    end
  end
end