class CreateDistros < ActiveRecord::Migration
  def change
    create_table :distros do |t|
      t.string :name
      t.string :info
      t.boolean :valid

      t.timestamps
    end
  end
end
