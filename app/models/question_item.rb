class QuestionItem < ApplicationRecord
  has_one :topic
  has_many :answers
end
