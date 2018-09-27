class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.text :name
      t.string :username
      t.string :email
      t.string :password_digest
    end
  end
end