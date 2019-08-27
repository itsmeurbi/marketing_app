# frozen_string_literal: true

class CorporationsController < ApplicationController
  def new
    @corporation = Corporation.new
  end

  def create
    @corporation = Corporation.new(corporation_params)
    if @corporation.save
      flash[:notice] = 'Corporación registrada'
      redirect_to root_path
    else
      flash.now[:alert] = 'Error guardando corporación'
      render 'new'
    end
  end

  def edit
    @corporation = Corporation.find(params[:id])
  end

  def destroy
    @corporation = Corporation.find(params[:id])
    if @corporation.destroy
      flash[:notice] = 'Corporación eliminada correctamente'
    else
      flash[:alert] = 'Error eliminando corporación'
    end
    redirect_to root_path
  end

  def update
    @corporation = Corporation.find(params[:id])
    if @corporation.update(corporation_params)
      flash[:notice] = 'Corporación actualizada correctamente'
    else
      flash[:alert] = 'Error actualizando corporación'
    end
    redirect_to root_path
  end

  def show
    @corporation = Corporation.find(params[:id])
  end

  private

  def corporation_params
    params.require(:corporation).permit(:name)
  end
end
