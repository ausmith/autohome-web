class ActiveRecord::Base
  attr_accessible
  attr_accessor :accessible
    
    private
    def mass_assignment_authorizer(role = :default)
      # puts "Role: #{role}"
      if accessible == :all
        self.class.protected_attributes
      else
        # puts "mass_assignment_authorizer"
        #    puts accessible
        super + (accessible || [])
      end
    end
end