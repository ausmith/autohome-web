class AddNodeAuthCodesToSecEventTypes < ActiveRecord::Migration
  def up
    SecEventType.create :type_cd => 'NODEPASS', :description => 'sec_event_types.auth.node.keypass'
    SecEventType.create :type_cd => 'NODEFAIL', :description => 'sec_event_types.auth.node.keyfail'
  end

  def down
    SecEventType.where(:description => 'sec_event_types.auth.node.keyfail').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.node.keypass').destroy_all
  end
end
