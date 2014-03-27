module RoomsHelper
  def get_room_link(room)
    room ? link_to(room.name, room) : '-'
  end
end
