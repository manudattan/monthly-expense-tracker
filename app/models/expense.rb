# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  amount      :integer
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :integer
#  category_id :integer
#  user_id     :integer
#
class Expense < ApplicationRecord
   belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
   
   belongs_to(:category, { :required => false, :class_name => "Category", :foreign_key => "category_id" })

   belongs_to(:business, { :required => false, :class_name => "Business", :foreign_key => "business_id" })

   validates(:date, { :presence => true })

   validates(:amount, { :presence => true })

end
