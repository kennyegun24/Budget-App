class User < ApplicationRecord
    has_many :entities, foreign_key: 'user_id', class_name: 'Entity'
    has_many :groups, foreign_key: 'user_id', class_name: 'Group'

    validates :name, presence: true, length: { maximum: 100 }
end
