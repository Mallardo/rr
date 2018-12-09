class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :avatar_url
      t.string :country
      t.text :achievement
      t.date :birthday
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
