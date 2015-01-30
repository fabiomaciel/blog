class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
