class ExpensesController < ApplicationController
  def index
    #matching_expenses = Expense.where({:user_id => @current_user.id})
    matching_expenses = @current_user.expenses

    @list_of_expenses = matching_expenses.order({ :created_at => :desc })

    render({ :template => "expenses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_expenses = Expense.where({ :id => the_id })

    @the_expense = matching_expenses.at(0)

    render({ :template => "expenses/show.html.erb" })
  end

  def create
    the_expense = Expense.new
    the_expense.date = params.fetch("query_date")
    the_expense.user_id = @current_user.id
    the_expense.category_id = params.fetch("query_category_id")
    the_expense.business_id = params.fetch("query_business_id")
    the_expense.amount = params.fetch("query_amount")

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses", { :notice => "Expense created successfully." })
    else
      redirect_to("/expenses", { :notice => "Expense failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.date = params.fetch("query_date")
    the_expense.user_id = params.fetch("query_user_id")
    the_expense.category_id = params.fetch("query_category_id")
    the_expense.business_id = params.fetch("query_business_id")
    the_expense.amount = params.fetch("query_amount")

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses/#{the_expense.id}", { :notice => "Expense updated successfully."} )
    else
      redirect_to("/expenses/#{the_expense.id}", { :alert => "Expense failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.destroy

    redirect_to("/expenses", { :notice => "Expense deleted successfully."} )
  end
end
