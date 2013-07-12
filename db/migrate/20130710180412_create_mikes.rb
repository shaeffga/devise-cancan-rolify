class CreateMikes < ActiveRecord::Migration
  def change
    create_table :mikes do |t|
      t.string :issue
      t.text :complaining

      t.timestamps
    end
  end
end
