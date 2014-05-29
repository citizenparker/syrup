class PatronsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Patrons", :patrons_path

  def index
    @patrons = Patron.all.order(:created_at => :desc)
  end

  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.create(_patron_params)
    if @patron.persisted?
      redirect_to patron_path(@patron)
    else
      render :new
    end
  end

  def show
    @patron = Patron.find(params[:id])
    add_breadcrumb @patron.name, patron_path(@patron)
  end

  def edit
    @patron = Patron.find(params[:id])
    add_breadcrumb @patron.name, patron_path(@patron)
  end

  def update
    @patron = Patron.find(params[:id])
    if @patron.update_attributes(_patron_params)
      redirect_to patron_path(@patron)
    else
      add_breadcrumb @patron.name, patron_path(@patron)
      render :edit
    end
  end

  def _patron_params
    params[:patron].permit(:name, :address_street, :address_city, :address_zipcode, :age)
  end
end
