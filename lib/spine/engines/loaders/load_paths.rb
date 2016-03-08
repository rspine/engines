module Spine
  module Engines
    module Loaders
      module LoadPaths
        extend self

        def call(app)
          app.load_paths!(app.load_paths || [])
        end
      end
    end
  end
end
