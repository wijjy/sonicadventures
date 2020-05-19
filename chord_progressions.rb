#
use_synth :zawa

emchords = [chord(:E, :minor7),
            chord(:Gb, 'm7-5'),
            chord(:G, :major7),
            chord(:A, :minor7),
            chord(:B, :minor7),
            chord(:C, :major7),
            chord(:D, '7')
            ]


progressions = [[0, 5, 6],
                [0, 4, 6],
                [0, 3, 4],
                [0, 5, 2, 6],
                [1, 4, 0]
                ]


prog = progressions[4]
live_loop :chords do
  play emchords[prog.tick]
  sleep 1
end