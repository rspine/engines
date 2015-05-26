module Spine
  module Engines
    module Loaders
      module LoadPaths
        extend self

        def call(app)
          app.load_paths.each do |path|
            Dir[app.root.join(path)].each { |file| require file }
          end
        end
      end
    end
  end
end
