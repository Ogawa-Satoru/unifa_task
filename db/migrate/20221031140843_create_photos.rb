class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.string :title, limit: 30

      t.timestamps
    end
  end
end
