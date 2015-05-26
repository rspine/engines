module Spine
  module Engines
    module Extensions
      def extension(plugin)
        if plugin.respond_to?(:configuration) && plugin.configuration
          self.extend(plugin.configuration)
        end

        if plugin.respond_to?(:loader) && plugin.loader
          self.loaders << plugin.loader
        end

        self
      end
    end
  end
end
