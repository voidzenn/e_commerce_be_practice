class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.boolean :is_email_verified
      t.string :password_digest
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
