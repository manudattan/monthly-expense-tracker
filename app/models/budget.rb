# == Schema Information
#
# Table name: budgets
#
#  id               :integer          not null, primary key
#  alert_percentage :integer
#  amount           :integer
#  date             :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#  user_id          :integer
#
class Budget < ApplicationRecord
    belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

    belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id" })

    validates(:date, { :presence => true })

    validates(:amount, { :presence => true })

    validates(:alert_percentage, { :numericality => { :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0 } })

    validates(:alert_percentage, { :presence => true })

end
