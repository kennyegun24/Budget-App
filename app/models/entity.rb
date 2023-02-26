class Entity < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :entity_groups
    has_many :groups, through: :entity_groups

  validates :name, presence: true, length: { maximum: 100 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
