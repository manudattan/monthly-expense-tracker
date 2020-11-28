Rails.application.routes.draw do



  # Routes for the Budget resource:

  # CREATE
  post("/insert_budget", { :controller => "budgets", :action => "create" })
          
  # READ
  get("/budgets", { :controller => "budgets", :action => "index" })
  
  get("/budgets/:path_id", { :controller => "budgets", :action => "show" })
  
  # UPDATE
  
  post("/modify_budget/:path_id", { :controller => "budgets", :action => "update" })
  
  # DELETE
  get("/delete_budget/:path_id", { :controller => "budgets", :action => "destroy" })

  #------------------------------

  # Routes for the Expense resource:

  # CREATE
  post("/insert_expense", { :controller => "expenses", :action => "create" })
          
  # READ
  get("/expenses", { :controller => "expenses", :action => "index" })
  
  get("/expenses/:path_id", { :controller => "expenses", :action => "show" })
  
  # UPDATE
  
  post("/modify_expense/:path_id", { :controller => "expenses", :action => "update" })
  
  # DELETE
  get("/delete_expense/:path_id", { :controller => "expenses", :action => "destroy" })

  #------------------------------

  # Routes for the Business resource:

  # CREATE
  post("/insert_business", { :controller => "businesses", :action => "create" })
          
  # READ
  get("/businesses", { :controller => "businesses", :action => "index" })
  
  get("/businesses/:path_id", { :controller => "businesses", :action => "show" })
  
  # UPDATE
  
  post("/modify_business/:path_id", { :controller => "businesses", :action => "update" })
  
  # DELETE
  get("/delete_business/:path_id", { :controller => "businesses", :action => "destroy" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
