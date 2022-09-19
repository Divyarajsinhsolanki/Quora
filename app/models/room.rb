class Room < ApplicationRecord
    scope :public_rooms, -> { where(is_private: false) }
    has_many :messages
end
