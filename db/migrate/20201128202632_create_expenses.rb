class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.date :date
      t.integer :user_id
      t.integer :category_id
      t.integer :business_id
      t.integer :amount

      t.timestamps
    end
  end
end
