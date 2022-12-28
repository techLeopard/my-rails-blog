class Topic < ApplicationRecord
    has_many :questions
    has_many :answers, through: :questions
end
