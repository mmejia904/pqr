class CreateFollowups < ActiveRecord::Migration[6.0]
  def change
    create_table :followups do |t|
      t.string :commenter
      t.text :body
      t.references :inquiry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
