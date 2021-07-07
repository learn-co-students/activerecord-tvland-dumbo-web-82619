require 'pry'

class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network
  
    def actors_list
        characters = Character.all.select do |character|
            character.show_id == self.id
        end
        actors = characters.map do |character|
            Actor.all.find do |actor|
                actor.id == character.actor_id
            end
        end
        actors.map do |actor|
            actor.full_name
        end
    end

end