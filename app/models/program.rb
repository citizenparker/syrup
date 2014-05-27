class Program < ActiveRecord::Base
  validates_presence_of :name, :maximum_participants, :minimum_age, :maximum_age
end
