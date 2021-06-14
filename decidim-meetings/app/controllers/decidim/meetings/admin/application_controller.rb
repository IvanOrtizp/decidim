# frozen_string_literal: true

module Decidim
  module Meetings
    module Admin
      # This controller is the abstract class from which all other controllers of
      # this engine inherit.
      #
      # Note that it inherits from `Decidim::Components::BaseController`, which
      # override its layout and provide all kinds of useful methods.
      class ApplicationController < Decidim::Admin::Components::BaseController
        helper Decidim::ApplicationHelper
        helper_method :meetings, :meeting, :maps_enabled?

        def meetings
          @meetings ||= Meeting.not_hidden.where(component: current_component).order(start_time: :desc).page(params[:page]).per(15)
        end

        def meeting
          @meeting ||= meetings.find(params[:id]) if params[:id]
        end

        def maps_enabled?
          @maps_enabled ||= current_component.settings.maps_enabled?
        end
      end
    end
  end
end
