# frozen_string_literal: true

module Community
  class CoworkersController < BaseController
    def create
      @coworker = Coworker.new(coworker_params)
      if @coworker.save
        flash[:notice] = 'Registrado correctamente'
      else
        flash[:alert] = 'Error registrando'
      end
      redirect_to community_campain_path(@coworker.campain)
    end

    private

    def coworker_params
      params.require(:coworker)
            .permit(:role)
            .merge(campain: Campain.find(params[:campain_id]),
                   user: User.find_by_id(params[:coworker][:user]))
    end
  end
end
