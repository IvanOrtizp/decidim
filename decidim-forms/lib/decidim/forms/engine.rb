# frozen_string_literal: true

require "decidim/core"

module Decidim
  module Forms
    # This is the engine that runs on the public interface of `decidim-forms`.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Forms

      initializer "decidim_forms.add_cells_view_paths" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::Forms::Engine.root}/app/cells")
      end
    end
  end
end
