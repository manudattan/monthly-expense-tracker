class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.integer :user_id
      t.date :date
      t.integer :amount
      t.integer :category_id
      t.integer :alert_percentage

      t.timestamps
    end
  end
end
