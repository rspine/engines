require 'pathname'
require 'logger'

module Spine
  module Engines
    module Configuration
      attr_accessor :environment, :root, :load_paths
      attr_accessor :builder, :middleware
      attr_accessor :logger, :router

      def builder
        @builder ||= Rack::Builder.new
      end

      def middleware
        @middleware || builder
      end

      def root=(value)
        @root = Pathname.new(value)
      end

      def logger
        @logger ||= Logger.new(STDOUT)
      end

      def configure
        yield(self) if block_given?
      end
    end
  end
end
