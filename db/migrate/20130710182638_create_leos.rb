class CreateLeos < ActiveRecord::Migration
  def change
    create_table :leos do |t|
      t.string :issue
      t.text :complaining

      t.timestamps
    end
  end
end
