##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class EntityContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class ChallengeList < ListResource
              ##
              # Initialize the ChallengeList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity Customer unique identity for the Entity owner of the
              #   Challenge
              # @return [ChallengeList] ChallengeList
              def initialize(version, service_sid: nil, identity: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity}
                @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Challenges"
              end

              ##
              # Create the ChallengeInstance
              # @param [String] factor_sid The unique SID identifier of the Factor.
              # @param [Time] expiration_date The future date in which this Challenge will
              #   expire, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
              # @param [String] details Details provided to give context about the Challenge.
              #   Shown to the end user. It must be a stringified JSON with the following
              #   structure: {"message": "string", "fields": [ { "label": "string", "value":
              #   "string"}]}. `message` is required. If you send the `fields` property, each
              #   field has to include `label` and `value` properties. If you had set
              #   `include_date=true` in the `push` configuration of the
              #   [service](https://www.twilio.com/docs/verify/api/service), the response will
              #   also include the challenge's date created value as an additional field called
              #   `date`
              # @param [String] hidden_details Details provided to give context about the
              #   Challenge. Not shown to the end user. It must be a stringified JSON with only
              #   strings values eg. `{"ip": "172.168.1.234"}`
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @return [ChallengeInstance] Created ChallengeInstance
              def create(factor_sid: nil, expiration_date: :unset, details: :unset, hidden_details: :unset, twilio_sandbox_mode: :unset)
                data = Twilio::Values.of({
                    'FactorSid' => factor_sid,
                    'ExpirationDate' => Twilio.serialize_iso8601_datetime(expiration_date),
                    'Details' => details,
                    'HiddenDetails' => hidden_details,
                })
                headers = Twilio::Values.of({'Twilio-Sandbox-Mode' => twilio_sandbox_mode, })

                payload = @version.create('POST', @uri, data: data, headers: headers)

                ChallengeInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Lists ChallengeInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [String] factor_sid The unique SID identifier of the Factor.
              # @param [challenge.ChallengeStatuses] status The Status of the Challenges to
              #   fetch. One of `pending`, `expired`, `approved` or `denied`.
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(factor_sid: :unset, status: :unset, twilio_sandbox_mode: :unset, limit: nil, page_size: nil)
                self.stream(
                    factor_sid: factor_sid,
                    status: status,
                    twilio_sandbox_mode: twilio_sandbox_mode,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams ChallengeInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] factor_sid The unique SID identifier of the Factor.
              # @param [challenge.ChallengeStatuses] status The Status of the Challenges to
              #   fetch. One of `pending`, `expired`, `approved` or `denied`.
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(factor_sid: :unset, status: :unset, twilio_sandbox_mode: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    factor_sid: factor_sid,
                    status: status,
                    twilio_sandbox_mode: twilio_sandbox_mode,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields ChallengeInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of ChallengeInstance records from the API.
              # Request is executed immediately.
              # @param [String] factor_sid The unique SID identifier of the Factor.
              # @param [challenge.ChallengeStatuses] status The Status of the Challenges to
              #   fetch. One of `pending`, `expired`, `approved` or `denied`.
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ChallengeInstance
              def page(factor_sid: :unset, status: :unset, twilio_sandbox_mode: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'FactorSid' => factor_sid,
                    'Status' => status,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                headers = Twilio::Values.of({'Twilio-Sandbox-Mode' => twilio_sandbox_mode, })

                response = @version.page('GET', @uri, params: params, headers: headers)

                ChallengePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ChallengeInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of ChallengeInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                ChallengePage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Verify.V2.ChallengeList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class ChallengePage < Page
              ##
              # Initialize the ChallengePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [ChallengePage] ChallengePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ChallengeInstance
              # @param [Hash] payload Payload response from the API
              # @return [ChallengeInstance] ChallengeInstance
              def get_instance(payload)
                ChallengeInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Verify.V2.ChallengePage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class ChallengeContext < InstanceContext
              ##
              # Initialize the ChallengeContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity The unique external identifier for the Entity of the
              #   Service. This identifier should be immutable, not PII, and generated by your
              #   external system, such as your user's UUID, GUID, or SID.
              # @param [String] sid A 34 character string that uniquely identifies this
              #   Challenge.
              # @return [ChallengeContext] ChallengeContext
              def initialize(version, service_sid, identity, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Challenges/#{@solution[:sid]}"
              end

              ##
              # Fetch the ChallengeInstance
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @return [ChallengeInstance] Fetched ChallengeInstance
              def fetch(twilio_sandbox_mode: :unset)
                headers = Twilio::Values.of({'Twilio-Sandbox-Mode' => twilio_sandbox_mode, })

                payload = @version.fetch('GET', @uri, headers: headers)

                ChallengeInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the ChallengeInstance
              # @param [String] auth_payload The optional payload needed to verify the
              #   Challenge. E.g., a TOTP would use the numeric code.
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @return [ChallengeInstance] Updated ChallengeInstance
              def update(auth_payload: :unset, twilio_sandbox_mode: :unset)
                data = Twilio::Values.of({'AuthPayload' => auth_payload, })
                headers = Twilio::Values.of({'Twilio-Sandbox-Mode' => twilio_sandbox_mode, })

                payload = @version.update('POST', @uri, data: data, headers: headers)

                ChallengeInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Verify.V2.ChallengeContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Verify.V2.ChallengeContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class ChallengeInstance < InstanceResource
              ##
              # Initialize the ChallengeInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity Customer unique identity for the Entity owner of the
              #   Challenge
              # @param [String] sid A 34 character string that uniquely identifies this
              #   Challenge.
              # @return [ChallengeInstance] ChallengeInstance
              def initialize(version, payload, service_sid: nil, identity: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'entity_sid' => payload['entity_sid'],
                    'identity' => payload['identity'],
                    'factor_sid' => payload['factor_sid'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'date_responded' => Twilio.deserialize_iso8601_datetime(payload['date_responded']),
                    'expiration_date' => Twilio.deserialize_iso8601_datetime(payload['expiration_date']),
                    'status' => payload['status'],
                    'responded_reason' => payload['responded_reason'],
                    'details' => payload['details'],
                    'hidden_details' => payload['hidden_details'],
                    'factor_type' => payload['factor_type'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'service_sid' => service_sid, 'identity' => identity, 'sid' => sid || @properties['sid'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [ChallengeContext] ChallengeContext for this ChallengeInstance
              def context
                unless @instance_context
                  @instance_context = ChallengeContext.new(
                      @version,
                      @params['service_sid'],
                      @params['identity'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A string that uniquely identifies this Challenge.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Service Sid.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] Entity Sid.
              def entity_sid
                @properties['entity_sid']
              end

              ##
              # @return [String] Unique external identifier of the Entity
              def identity
                @properties['identity']
              end

              ##
              # @return [String] Factor Sid.
              def factor_sid
                @properties['factor_sid']
              end

              ##
              # @return [Time] The date this Challenge was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this Challenge was updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [Time] The date this Challenge was responded
              def date_responded
                @properties['date_responded']
              end

              ##
              # @return [Time] The date this Challenge is expired
              def expiration_date
                @properties['expiration_date']
              end

              ##
              # @return [challenge.ChallengeStatuses] The Status of this Challenge
              def status
                @properties['status']
              end

              ##
              # @return [challenge.ChallengeReasons] The Reason of this Challenge `status`
              def responded_reason
                @properties['responded_reason']
              end

              ##
              # @return [String] Public details provided to contextualize the Challenge
              def details
                @properties['details']
              end

              ##
              # @return [String] Hidden details provided to contextualize the Challenge
              def hidden_details
                @properties['hidden_details']
              end

              ##
              # @return [challenge.FactorTypes] The Factor Type of this Challenge
              def factor_type
                @properties['factor_type']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # Fetch the ChallengeInstance
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @return [ChallengeInstance] Fetched ChallengeInstance
              def fetch(twilio_sandbox_mode: :unset)
                context.fetch(twilio_sandbox_mode: twilio_sandbox_mode, )
              end

              ##
              # Update the ChallengeInstance
              # @param [String] auth_payload The optional payload needed to verify the
              #   Challenge. E.g., a TOTP would use the numeric code.
              # @param [String] twilio_sandbox_mode The Twilio-Sandbox-Mode HTTP request header
              # @return [ChallengeInstance] Updated ChallengeInstance
              def update(auth_payload: :unset, twilio_sandbox_mode: :unset)
                context.update(auth_payload: auth_payload, twilio_sandbox_mode: twilio_sandbox_mode, )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Verify.V2.ChallengeInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Verify.V2.ChallengeInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end