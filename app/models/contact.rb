class Contact < ApplicationRecord

    belongs_to :group

    validates :telephone, presence: true
    validates :name, presence: true
    validates :email, presence: true
    validates :name, length: {minimum: 5}
end
