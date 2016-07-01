# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module IAM
    class PolicyVersion

      extend Aws::Deprecations

      # @overload def initialize(arn, version_id, options = {})
      #   @param [String] arn
      #   @param [String] version_id
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :arn
      #   @option options [required, String] :version_id
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @arn = extract_arn(args, options)
        @version_id = extract_version_id(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def arn
        @arn
      end

      # @return [String]
      def version_id
        @version_id
      end

      # The policy document.
      #
      # The policy document is returned in the response to the
      # GetPolicyVersion and GetAccountAuthorizationDetails operations. It is
      # not returned in the response to the CreatePolicyVersion or
      # ListPolicyVersions operations.
      # @return [String]
      def document
        data.document
      end

      # Specifies whether the policy version is set as the policy\'s default
      # version.
      # @return [Boolean]
      def is_default_version
        data.is_default_version
      end

      # The date and time, in [ISO 8601 date-time format][1], when the policy
      # version was created.
      #
      #
      #
      # [1]: http://www.iso.org/iso/iso8601
      # @return [Time]
      def create_date
        data.create_date
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {PolicyVersion}.
      # Returns `self` making it possible to chain methods.
      #
      #     policy_version.reload.data
      #
      # @return [self]
      def load
        resp = @client.get_policy_version(
          policy_arn: @arn,
          version_id: @version_id
        )
        @data = resp.policyversion
        self
      end
      alias :reload :load

      # @return [Types::PolicyVersion]
      #   Returns the data for this {PolicyVersion}. Calls
      #   {Client#get_policy_version} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Actions

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(
          policy_arn: @arn,
          version_id: @version_id
        )
        resp = @client.delete_policy_version(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def set_as_default(options = {})
        options = options.merge(
          policy_arn: @arn,
          version_id: @version_id
        )
        resp = @client.set_default_policy_version(options)
        resp.data
      end

      # @deprecated
      # @api private
      def identifiers
        {
          arn: @arn,
          version_id: @version_id
        }
      end
      deprecated(:identifiers)

      private

      def extract_arn(args, options)
        value = args[0] || options.delete(:arn)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :arn"
        else
          msg = "expected :arn to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def extract_version_id(args, options)
        value = args[1] || options.delete(:version_id)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :version_id"
        else
          msg = "expected :version_id to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<PolicyVersion>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end