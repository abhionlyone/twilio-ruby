##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class DeployedDevices < Version
        class FleetContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DeviceList < ListResource
            ##
            # Initialize the DeviceList
            # @param [Version] version Version that contains the resource
            # @param [String] fleet_sid Specifies the unique string identifier of the Fleet
            #   that the given Device belongs to.
            # @return [DeviceList] DeviceList
            def initialize(version, fleet_sid: nil)
              super(version)

              # Path Solution
              @solution = {fleet_sid: fleet_sid}
              @uri = "/Fleets/#{@solution[:fleet_sid]}/Devices"
            end

            ##
            # Retrieve a single page of DeviceInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Device, to be used in addition to SID, up to 128 characters
            #   long.
            # @param [String] friendly_name Provides a human readable descriptive text to be
            #   assigned to this Device, up to 256 characters long.
            # @param [String] identity Provides an arbitrary string identifier representing a
            #   human user to be associated with this Device, up to 256 characters long.
            # @param [String] deployment_sid Specifies the unique string identifier of the
            #   Deployment group that this Device is going to be associated with.
            # @param [Boolean] enabled The enabled
            # @return [DeviceInstance] Newly created DeviceInstance
            def create(unique_name: :unset, friendly_name: :unset, identity: :unset, deployment_sid: :unset, enabled: :unset)
              data = Twilio::Values.of({
                  'UniqueName' => unique_name,
                  'FriendlyName' => friendly_name,
                  'Identity' => identity,
                  'DeploymentSid' => deployment_sid,
                  'Enabled' => enabled,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              DeviceInstance.new(@version, payload, fleet_sid: @solution[:fleet_sid])
            end

            ##
            # Lists DeviceInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] deployment_sid Filters the resulting list of Devices by a unique
            #   string identifier of the Deployment they are associated with.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(deployment_sid: :unset, limit: nil, page_size: nil)
              self.stream(deployment_sid: deployment_sid, limit: limit, page_size: page_size).entries
            end

            ##
            # Streams DeviceInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] deployment_sid Filters the resulting list of Devices by a unique
            #   string identifier of the Deployment they are associated with.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(deployment_sid: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(deployment_sid: deployment_sid, page_size: limits[:page_size])

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields DeviceInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size])

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of DeviceInstance records from the API.
            # Request is executed immediately.
            # @param [String] deployment_sid Filters the resulting list of Devices by a unique
            #   string identifier of the Deployment they are associated with.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of DeviceInstance
            def page(deployment_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'DeploymentSid' => deployment_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              DevicePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of DeviceInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of DeviceInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              DevicePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.DeployedDevices.DeviceList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DevicePage < Page
            ##
            # Initialize the DevicePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [DevicePage] DevicePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of DeviceInstance
            # @param [Hash] payload Payload response from the API
            # @return [DeviceInstance] DeviceInstance
            def get_instance(payload)
              DeviceInstance.new(@version, payload, fleet_sid: @solution[:fleet_sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.DeployedDevices.DevicePage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DeviceContext < InstanceContext
            ##
            # Initialize the DeviceContext
            # @param [Version] version Version that contains the resource
            # @param [String] fleet_sid The fleet_sid
            # @param [String] sid Provides a 34 character string that uniquely identifies the
            #   requested Device resource.
            # @return [DeviceContext] DeviceContext
            def initialize(version, fleet_sid, sid)
              super(version)

              # Path Solution
              @solution = {fleet_sid: fleet_sid, sid: sid}
              @uri = "/Fleets/#{@solution[:fleet_sid]}/Devices/#{@solution[:sid]}"
            end

            ##
            # Fetch a DeviceInstance
            # @return [DeviceInstance] Fetched DeviceInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              DeviceInstance.new(@version, payload, fleet_sid: @solution[:fleet_sid], sid: @solution[:sid])
            end

            ##
            # Deletes the DeviceInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Update the DeviceInstance
            # @param [String] friendly_name Provides a human readable descriptive text to be
            #   assigned to this Device, up to 256 characters long.
            # @param [String] identity Provides an arbitrary string identifier representing a
            #   human user to be associated with this Device, up to 256 characters long.
            # @param [String] deployment_sid Specifies the unique string identifier of the
            #   Deployment group that this Device is going to be associated with.
            # @param [Boolean] enabled The enabled
            # @return [DeviceInstance] Updated DeviceInstance
            def update(friendly_name: :unset, identity: :unset, deployment_sid: :unset, enabled: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'Identity' => identity,
                  'DeploymentSid' => deployment_sid,
                  'Enabled' => enabled,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              DeviceInstance.new(@version, payload, fleet_sid: @solution[:fleet_sid], sid: @solution[:sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.DeployedDevices.DeviceContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DeviceInstance < InstanceResource
            ##
            # Initialize the DeviceInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] fleet_sid Specifies the unique string identifier of the Fleet
            #   that the given Device belongs to.
            # @param [String] sid Provides a 34 character string that uniquely identifies the
            #   requested Device resource.
            # @return [DeviceInstance] DeviceInstance
            def initialize(version, payload, fleet_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'url' => payload['url'],
                  'unique_name' => payload['unique_name'],
                  'friendly_name' => payload['friendly_name'],
                  'fleet_sid' => payload['fleet_sid'],
                  'enabled' => payload['enabled'],
                  'account_sid' => payload['account_sid'],
                  'identity' => payload['identity'],
                  'deployment_sid' => payload['deployment_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'date_authenticated' => Twilio.deserialize_iso8601_datetime(payload['date_authenticated']),
              }

              # Context
              @instance_context = nil
              @params = {'fleet_sid' => fleet_sid, 'sid' => sid || @properties['sid']}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [DeviceContext] DeviceContext for this DeviceInstance
            def context
              unless @instance_context
                @instance_context = DeviceContext.new(@version, @params['fleet_sid'], @params['sid'])
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this Device.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] URL of this Device.
            def url
              @properties['url']
            end

            ##
            # @return [String] A unique, addressable name of this Device.
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] A human readable description for this Device
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The unique identifier of the Fleet.
            def fleet_sid
              @properties['fleet_sid']
            end

            ##
            # @return [Boolean] Device enabled flag.
            def enabled
              @properties['enabled']
            end

            ##
            # @return [String] The unique SID that identifies this Account.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] An identifier of the Device user.
            def identity
              @properties['identity']
            end

            ##
            # @return [String] The unique SID of the Deployment group.
            def deployment_sid
              @properties['deployment_sid']
            end

            ##
            # @return [Time] The date this Device was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this Device was updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Time] The date this Device was authenticated.
            def date_authenticated
              @properties['date_authenticated']
            end

            ##
            # Fetch a DeviceInstance
            # @return [DeviceInstance] Fetched DeviceInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the DeviceInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Update the DeviceInstance
            # @param [String] friendly_name Provides a human readable descriptive text to be
            #   assigned to this Device, up to 256 characters long.
            # @param [String] identity Provides an arbitrary string identifier representing a
            #   human user to be associated with this Device, up to 256 characters long.
            # @param [String] deployment_sid Specifies the unique string identifier of the
            #   Deployment group that this Device is going to be associated with.
            # @param [Boolean] enabled The enabled
            # @return [DeviceInstance] Updated DeviceInstance
            def update(friendly_name: :unset, identity: :unset, deployment_sid: :unset, enabled: :unset)
              context.update(
                  friendly_name: friendly_name,
                  identity: identity,
                  deployment_sid: deployment_sid,
                  enabled: enabled,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.DeployedDevices.DeviceInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.DeployedDevices.DeviceInstance #{values}>"
            end
          end
        end
      end
    end
  end
end