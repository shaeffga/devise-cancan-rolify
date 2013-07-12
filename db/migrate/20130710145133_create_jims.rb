class CreateJims < ActiveRecord::Migration
  def change
    create_table :jims do |t|
      t.string :issue
      t.text :complaining

      t.timestamps
    end
  end
end
