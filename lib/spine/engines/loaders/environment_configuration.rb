module Spine
  module Engines
    module Loaders
      module EnvironmentConfiguration
        extend self

        def call(app)
          require app.root.join('config', 'environments', app.environment).to_s
        end
      end
    end
  end
end
