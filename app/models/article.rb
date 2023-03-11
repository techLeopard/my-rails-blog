class Article < ApplicationRecord
    # Scopes
    default_scope {order(created_at: :desc)}

    # Validators
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
