module Spine
  module Engines
    module Application
      include Configuration
      include Loaders
      include Extensions

      def initialize!
        load
        finalize!
      end

      def call(env)
        finalize!.call(env)
      end

      private

      def finalize!
        @finalized_app ||= builder.to_app
      end

      def load
        loaders.each { |loader| loader.call(self) }
      end
    end
  end
end
