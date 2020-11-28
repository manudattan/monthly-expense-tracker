# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

    has_many(:expenses, { :class_name => "Expense", :foreign_key => "category_id", :dependent => :destroy })

    has_many(:budgets, { :class_name => "Budget", :foreign_key => "category_id", :dependent => :destroy })

    has_many(:users, { :through => :expenses, :source => :user })

    has_many(:budget_users, { :through => :budgets, :source => :user })

    validates(:name, { :presence => true })

    validates(:name, { :uniqueness => true })

end
