# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = 'Compañia creada correctamente'
      redirect_to root_path
    else
      flash[:alert] = 'Error creado compañia'
      render 'new'
    end
  end

  def update
    if @company.update(company_params)
      flash[:notice] = 'Compaia actualizada correctamente'
    else
      flash[:alert] = 'Error actualizando compañia'
    end
    redirect_to root_path
  end

  def destroy
    if @company.destroy
      flash[:notice] = 'Compañia eliminada correctamente'
    else
      flash[:alert] = 'Error eliminando la compañia'
    end
    redirect_to root_path
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
