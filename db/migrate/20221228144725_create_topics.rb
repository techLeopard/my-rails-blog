class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.text :content

      t.timestamps
    end
  end
end
