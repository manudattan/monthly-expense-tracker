# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:expenses, { :class_name => "Expense", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:budgets, { :class_name => "Budget", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:categories, { :through => :expenses, :source => :category })

  has_many(:budget_categories, { :through => :budgets, :source => :category })

  has_many(:businesses, { :through => :expenses, :source => :business })

  validates(:last_name, { :presence => true })

  validates(:first_name, { :presence => true })

end
