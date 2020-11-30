class UserAuthenticationController < ApplicationController
  # Uncomment this if you want to force users to sign in before any other actions
  # skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })
  require "date"
  def homepage
    render({ :template => "user_authentication/homepage.html.erb" })
  end

  def dashboard
            
    render({ :template => "user_authentication/dashboard.html.erb" })
  end
  
  def show_dashboard
    @start_date = params.fetch("query_start_date")
    @end_date = params.fetch("query_end_date")

    matching_budgets = @current_user.budgets
    @list_of_budget = matching_budgets.where("date >= ?", @start_date).where("date <= ?", @end_date)
    matching_budget_categories = @list_of_budget.map_relation_to_array(:category_id)
    @list_of_budget_categories = matching_budget_categories.uniq
    @category_budget_total = 0

    matching_expenses = @current_user.expenses
    @list_of_expense = matching_expenses.where("date >= ?", @start_date).where("date <= ?", @end_date) 
    matching_expense_categories = @list_of_expense.map_relation_to_array(:category_id)
    @list_of_expense_categories = matching_expense_categories.uniq
    @category_expense_total = 0
    

    render({ :template => "user_authentication/show_dashboard.html.erb" })
  end  

    def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
 
end
