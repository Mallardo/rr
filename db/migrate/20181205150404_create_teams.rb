class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo_url
      t.string :country
      t.text :description
      t.text :achievement
      t.string :coach
      t.integer :creation_year

      t.timestamps
    end
  end
end
