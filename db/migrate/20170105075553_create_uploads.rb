class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.text :upload_data
      t.integer :user_id
      t.references :uploadable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
