class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
    ## Database authenticatable    
      t.references :product,               null: false, foreign_key: true
      t.references :user,                  null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
