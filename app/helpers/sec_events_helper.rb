module SecEventsHelper
  def create_audit(type, **options)
    o = {
      description: nil,
      user_id: nil,
      room_id: nil,
      node_id: nil,
      sensor_id: nil
    }.merge(options)

    e = SecEvent.new
    e.sec_event_type_cd = type
    e.ip = request.remote_ip
    e.room_id = o[:room_id]
    e.node_id = o[:node_id]
    e.sensor_id = o[:sensor_id]
    e.description = o[:description]
    e.user_id = o[:user_id]

    raise ActiveRecord::Rollback unless e.valid?

    e.save
  end

  def build_sec_event_description(event)
    t(event.sec_event_type.description,
      room: get_room_link(event.room),
      node: get_node_link(event.node),
      sensor: get_sensor_link(event.sensor),
      room: get_room_link(event.room),
      description: event.description)
  end
end
