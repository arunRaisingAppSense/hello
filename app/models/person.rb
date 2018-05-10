class Person < ApplicationRecord
  belongs_to :interaction, polymorphic: true
end
