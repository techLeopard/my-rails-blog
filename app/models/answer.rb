class Answer < ApplicationRecord
  belongs_to :question_item
  belongs_to :topic
end
