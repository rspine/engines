module Spine
  module Engines
    module Loaders
      module Initializers
        extend self

        def call(app)
          source = app.root.join('config', 'initializers', '*.rb')
          Dir[source].each { |file| require file }
        end
      end
    end
  end
end
