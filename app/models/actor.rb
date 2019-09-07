class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{first_name} #{last_name}"
    end

    def list_roles
        roles = Character.all.select do |character|
            character.actor_id == self.id 
        end
        roles.map do |role|
            "#{role.name} - #{Show.find(role.show_id).name}"
        end
    end

end