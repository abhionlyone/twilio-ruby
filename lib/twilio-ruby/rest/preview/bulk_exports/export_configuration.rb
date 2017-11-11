##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class BulkExports < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportConfigurationList < ListResource
          ##
          # Initialize the ExportConfigurationList
          # @param [Version] version Version that contains the resource
          # @return [ExportConfigurationList] ExportConfigurationList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.BulkExports.ExportConfigurationList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportConfigurationPage < Page
          ##
          # Initialize the ExportConfigurationPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ExportConfigurationPage] ExportConfigurationPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ExportConfigurationInstance
          # @param [Hash] payload Payload response from the API
          # @return [ExportConfigurationInstance] ExportConfigurationInstance
          def get_instance(payload)
            ExportConfigurationInstance.new(@version, payload)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.BulkExports.ExportConfigurationPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportConfigurationContext < InstanceContext
          ##
          # Initialize the ExportConfigurationContext
          # @param [Version] version Version that contains the resource
          # @param [String] resource_type The resource_type
          # @return [ExportConfigurationContext] ExportConfigurationContext
          def initialize(version, resource_type)
            super(version)

            # Path Solution
            @solution = {resource_type: resource_type}
            @uri = "/Exports/#{@solution[:resource_type]}/Configuration"
          end

          ##
          # Fetch a ExportConfigurationInstance
          # @return [ExportConfigurationInstance] Fetched ExportConfigurationInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ExportConfigurationInstance.new(@version, payload, resource_type: @solution[:resource_type])
          end

          ##
          # Update the ExportConfigurationInstance
          # @param [Boolean] enabled The enabled
          # @param [String] webhook_url The webhook_url
          # @param [String] webhook_method The webhook_method
          # @return [ExportConfigurationInstance] Updated ExportConfigurationInstance
          def update(enabled: :unset, webhook_url: :unset, webhook_method: :unset)
            data = Twilio::Values.of({
                'Enabled' => enabled,
                'WebhookUrl' => webhook_url,
                'WebhookMethod' => webhook_method,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ExportConfigurationInstance.new(@version, payload, resource_type: @solution[:resource_type])
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.BulkExports.ExportConfigurationContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ExportConfigurationInstance < InstanceResource
          ##
          # Initialize the ExportConfigurationInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] resource_type The resource_type
          # @return [ExportConfigurationInstance] ExportConfigurationInstance
          def initialize(version, payload, resource_type: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'enabled' => payload['enabled'],
                'webhook_url' => payload['webhook_url'],
                'webhook_method' => payload['webhook_method'],
                'resource_type' => payload['resource_type'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'resource_type' => resource_type || @properties['resource_type']}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ExportConfigurationContext] ExportConfigurationContext for this ExportConfigurationInstance
          def context
            unless @instance_context
              @instance_context = ExportConfigurationContext.new(@version, @params['resource_type'])
            end
            @instance_context
          end

          ##
          # @return [Boolean] The enabled
          def enabled
            @properties['enabled']
          end

          ##
          # @return [String] The webhook_url
          def webhook_url
            @properties['webhook_url']
          end

          ##
          # @return [String] The webhook_method
          def webhook_method
            @properties['webhook_method']
          end

          ##
          # @return [String] The resource_type
          def resource_type
            @properties['resource_type']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # Fetch a ExportConfigurationInstance
          # @return [ExportConfigurationInstance] Fetched ExportConfigurationInstance
          def fetch
            context.fetch
          end

          ##
          # Update the ExportConfigurationInstance
          # @param [Boolean] enabled The enabled
          # @param [String] webhook_url The webhook_url
          # @param [String] webhook_method The webhook_method
          # @return [ExportConfigurationInstance] Updated ExportConfigurationInstance
          def update(enabled: :unset, webhook_url: :unset, webhook_method: :unset)
            context.update(enabled: enabled, webhook_url: webhook_url, webhook_method: webhook_method)
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.BulkExports.ExportConfigurationInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.BulkExports.ExportConfigurationInstance #{values}>"
          end
        end
      end
    end
  end
end