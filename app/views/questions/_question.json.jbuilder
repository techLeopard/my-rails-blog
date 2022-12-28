json.extract! question, :id, :content, :topic_id, :created_at, :updated_at
json.url question_url(question, format: :json)
