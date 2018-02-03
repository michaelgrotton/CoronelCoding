class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :subjnum
      t.integer :dyad
      t.integer :whichtest
      t.string :condition
      t.string :date
      t.integer :photo
      t.string :code
      t.string :response
      t.integer :judgement, default:0
      t.string :coder

      t.timestamps null: false
    end
  end
end
