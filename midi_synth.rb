#midi synth

live_loop :ping_pong do
  use_real_time
  note, velocity = sync "/midi:oxygen_49:0:1/note_on"
  with_fx :echo do
    with_fx :flanger do
      synth :pluck, note: note, amp: velocity / 127.0
      synth :dsaw, note: note, amp: velocity / 127.0
    end
  end
end

