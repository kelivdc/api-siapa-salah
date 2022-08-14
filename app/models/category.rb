class Category < ApplicationRecord
    extend FriendlyId 
    friendly_id :name, use: :slugged
    validates :name, presence: true, uniqueness: true
    validates :slug, presence: true, uniqueness: true
    validates :sort, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
