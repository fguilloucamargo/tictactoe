class CreateUserChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :user_choices do |t|
      t.integer :choice
      t.integer :user
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
