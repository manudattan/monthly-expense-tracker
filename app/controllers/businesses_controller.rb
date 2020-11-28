class BusinessesController < ApplicationController
  def index
    matching_businesses = Business.all

    @list_of_businesses = matching_businesses.order({ :created_at => :desc })

    render({ :template => "businesses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_businesses = Business.where({ :id => the_id })

    @the_business = matching_businesses.at(0)

    render({ :template => "businesses/show.html.erb" })
  end

  def create
    the_business = Business.new
    the_business.name = params.fetch("query_name")

    if the_business.valid?
      the_business.save
      redirect_to("/businesses", { :notice => "Business created successfully." })
    else
      redirect_to("/businesses", { :notice => "Business failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_business = Business.where({ :id => the_id }).at(0)

    the_business.name = params.fetch("query_name")

    if the_business.valid?
      the_business.save
      redirect_to("/businesses/#{the_business.id}", { :notice => "Business updated successfully."} )
    else
      redirect_to("/businesses/#{the_business.id}", { :alert => "Business failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_business = Business.where({ :id => the_id }).at(0)

    the_business.destroy

    redirect_to("/businesses", { :notice => "Business deleted successfully."} )
  end
end
