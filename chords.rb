
use_synth :fm

key = :e

4.times do
  use_synth [:fm, :piano, :prophet, :zawa].tick
  puts "C Major"
  play chord(key, :major)
  sleep 1
  puts "C minor"
  play chord(key, :minor)
  sleep 1
  puts "C Diminished"
  play chord(key, :diminished)
  sleep 1
  puts "C Augmented"
  play chord(key, :augmented)
  sleep 1
  puts "C Suspended 4th"
  play chord(key, :sus4)
  sleep 1
  puts "C Major 7th"
  play chord(key, :major7)
  sleep 1
  puts "C Dominant 7th"
  play chord(key, :dom7)
  sleep 1
  puts "C minor 7th"
  play chord(key, :minor7)
  sleep 1
  puts "C minor 7b5 or C halfdiminished"
  play chord(key, :halfdiminished)
  sleep 1
  puts "C Diminished 7th"
  play chord(key, :dim7)
  sleep 1
end