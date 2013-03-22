class CreateTyokyos < ActiveRecord::Migration
  def change
    create_table :tyokyos do |t|
      t.string :before
      t.string :after

      t.timestamps
    end
  end
end
