class CreateRepos < ActiveRecord::Migration[7.0]
  def change
    create_table :repos do |t|
      t.string :Name
      t.decimal :Forknumber
      t.decimal :Stargazersnumber
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
