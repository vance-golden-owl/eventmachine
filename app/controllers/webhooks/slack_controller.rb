module Webhooks
  class SlackController < ApplicationController
    def endpoint
      if permitted_params[:challenge]
        render json: { challenge: params[:challenge] }, status: 200
        return
      end

      SlackMessageForwardJob.perform_later(permitted_params)
    end

    private

    def permitted_params
      params.permit!
    end
  end
end
