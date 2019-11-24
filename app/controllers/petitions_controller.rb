# frozen_string_literal: true

class PetitionsController < ApplicationController
  def create
    @petition = current_user.petitions.build(petition_params)
    if @petition.save
      flash[:notice] = 'Peticion creada correctamente'
    else
      flash[:alert] = 'Error al crear la peticion'
    end
    redirect_to community_campain_path(@petition.post.node.campain)
  end

  def update
    @petition = Petition.find(params[:id])
    if @petition.update(status: params[:status])
      flash[:notice] = 'Estado de la peticion actualizado'
    else
      flash[:alert] = 'Error actualizando el estado de la peticion'
    end
    redirect_user
  end

  private

  def petition_params
    params.require(:petition).permit(:content, :message,
                                     :status, :node, :coworker_id,
                                     :post_id)
  end

  def redirect_user
    if current_user.is_community_manager?
      redirect_to community_campain_path(@petition.post.node.campain)
    elsif current_user.is_content_creator?
      redirect_to content_creator_campain_path(@petition.post.node.campain)
    end
  end
end
