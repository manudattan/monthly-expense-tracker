# == Schema Information
#
# Table name: businesses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Business < ApplicationRecord
    has_many(:expenses, { :class_name => "Expense", :foreign_key => "business_id", :dependent => :destroy })

    has_many(:users, { :through => :expenses, :source => :user })

    validates(:name, { :presence => true })

    validates(:name, { :uniqueness => true })



end
