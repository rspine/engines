module Spine
  module Engines
    module Loaders
      autoload :Default, 'spine/engines/loaders/default'
      autoload :EnvironmentConfiguration, 'spine/engines/loaders/environment_configuration'
      autoload :Initializers, 'spine/engines/loaders/initializers'
      autoload :LoadPaths, 'spine/engines/loaders/load_paths'

      include Default
    end
  end
end
