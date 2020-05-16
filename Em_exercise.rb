
live_loop :atmos do
  sample "D:/samples/sonic_youth_hum.wav",
    rate: 1,
    amp: 3,
    pitch: choose([-5,-3,0,3, 5])
  sleep 2
end

live_loop :go do
  #sample :ambi_swoosh, amp: choose([0.2, 0.5])
  
  sample :drum_bass_soft, amp: 0.3
  sleep 0.08
  #  sample :drum_bass_soft, amp: 0.2
  #  sleep 0.08
  with_fx :wobble do
    sample :drum_bass_soft, amp: 0.2
    with_fx :reverb do
      with_fx :echo, phase: 0.125 do
        sample "D:/samples/beck_guitar_Em_echo.wav",
          pitch: choose([-5,0,5]),
          rate: 0.5,
          amp: 0.2 if one_in(3)
        with_synth :beep do
          play chord(:e3, :minor),
            amp: choose([0.3, 0.2, 0.5]),
            attack: 0.5,
            release: 2
        end
        sleep 1
        sample :elec_plip,
          amp: 0.3
        sleep 0.5
        play choose([:e4, :b4, [:e4, :g4, :b4]]),
          amp: choose([0.2, 0.1, 0.25])
      end
      sample "D:/samples/beck_guitar_Em_echo.wav",
        pitch: choose([-5,0,5]),
        rate: 0.5,
        amp: 0.2
    end
  end
  sleep 2.5
end