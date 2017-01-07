class CreateUploads < ActiveRecord::Migration
  
  def change
    create_table :uploads do |t|
      t.text :upload_data
      t.integer :user_id
      t.references :uploadable, polymorphic: true, index: true
      t.integer :folder_id

      t.timestamps null: false
    end

    add_index :uploads, :user_id
    add_index :uploads, :folder_id
  end
end
