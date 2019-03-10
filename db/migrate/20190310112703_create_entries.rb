class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
     t.string :word
     t.text :definition
     t.text :notes
     t.string :link
     t.integer :glossary_id
     t.datetime :created_at
     t.datetime :updated_at
     t.timestamps null: false
    end
  end
end
