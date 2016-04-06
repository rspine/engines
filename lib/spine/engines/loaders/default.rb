module Spine
  module Engines
    module Loaders
      module Default
        def loaders
          @loaders ||= default_loaders
        end

        def loaders=(value)
          @loaders = value
        end

        def default_loaders
          []
        end
      end
    end
  end
end
