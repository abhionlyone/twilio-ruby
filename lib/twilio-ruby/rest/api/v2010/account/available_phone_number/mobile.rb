##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class AvailablePhoneNumberCountryContext < InstanceContext
            class MobileList < ListResource
              ##
              # Initialize the MobileList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The 34 character string that uniquely identifies
              #   your account.
              # @param [String] country_code The ISO Country code to lookup phone numbers for.
              # @return [MobileList] MobileList
              def initialize(version, account_sid: nil, country_code: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, country_code: country_code}
                @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers/#{@solution[:country_code]}/Mobile.json"
              end

              ##
              # Lists MobileInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [String] area_code The area_code
              # @param [String] contains The contains
              # @param [Boolean] sms_enabled The sms_enabled
              # @param [Boolean] mms_enabled The mms_enabled
              # @param [Boolean] voice_enabled The voice_enabled
              # @param [Boolean] exclude_all_address_required The exclude_all_address_required
              # @param [Boolean] exclude_local_address_required The
              #   exclude_local_address_required
              # @param [Boolean] exclude_foreign_address_required The
              #   exclude_foreign_address_required
              # @param [Boolean] beta The beta
              # @param [String] near_number The near_number
              # @param [String] near_lat_long The near_lat_long
              # @param [String] distance The distance
              # @param [String] in_postal_code The in_postal_code
              # @param [String] in_region The in_region
              # @param [String] in_rate_center The in_rate_center
              # @param [String] in_lata The in_lata
              # @param [String] in_locality The in_locality
              # @param [Boolean] fax_enabled The fax_enabled
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(area_code: :unset, contains: :unset, sms_enabled: :unset, mms_enabled: :unset, voice_enabled: :unset, exclude_all_address_required: :unset, exclude_local_address_required: :unset, exclude_foreign_address_required: :unset, beta: :unset, near_number: :unset, near_lat_long: :unset, distance: :unset, in_postal_code: :unset, in_region: :unset, in_rate_center: :unset, in_lata: :unset, in_locality: :unset, fax_enabled: :unset, limit: nil, page_size: nil)
                self.stream(
                    area_code: area_code,
                    contains: contains,
                    sms_enabled: sms_enabled,
                    mms_enabled: mms_enabled,
                    voice_enabled: voice_enabled,
                    exclude_all_address_required: exclude_all_address_required,
                    exclude_local_address_required: exclude_local_address_required,
                    exclude_foreign_address_required: exclude_foreign_address_required,
                    beta: beta,
                    near_number: near_number,
                    near_lat_long: near_lat_long,
                    distance: distance,
                    in_postal_code: in_postal_code,
                    in_region: in_region,
                    in_rate_center: in_rate_center,
                    in_lata: in_lata,
                    in_locality: in_locality,
                    fax_enabled: fax_enabled,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams MobileInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] area_code The area_code
              # @param [String] contains The contains
              # @param [Boolean] sms_enabled The sms_enabled
              # @param [Boolean] mms_enabled The mms_enabled
              # @param [Boolean] voice_enabled The voice_enabled
              # @param [Boolean] exclude_all_address_required The exclude_all_address_required
              # @param [Boolean] exclude_local_address_required The
              #   exclude_local_address_required
              # @param [Boolean] exclude_foreign_address_required The
              #   exclude_foreign_address_required
              # @param [Boolean] beta The beta
              # @param [String] near_number The near_number
              # @param [String] near_lat_long The near_lat_long
              # @param [String] distance The distance
              # @param [String] in_postal_code The in_postal_code
              # @param [String] in_region The in_region
              # @param [String] in_rate_center The in_rate_center
              # @param [String] in_lata The in_lata
              # @param [String] in_locality The in_locality
              # @param [Boolean] fax_enabled The fax_enabled
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(area_code: :unset, contains: :unset, sms_enabled: :unset, mms_enabled: :unset, voice_enabled: :unset, exclude_all_address_required: :unset, exclude_local_address_required: :unset, exclude_foreign_address_required: :unset, beta: :unset, near_number: :unset, near_lat_long: :unset, distance: :unset, in_postal_code: :unset, in_region: :unset, in_rate_center: :unset, in_lata: :unset, in_locality: :unset, fax_enabled: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    area_code: area_code,
                    contains: contains,
                    sms_enabled: sms_enabled,
                    mms_enabled: mms_enabled,
                    voice_enabled: voice_enabled,
                    exclude_all_address_required: exclude_all_address_required,
                    exclude_local_address_required: exclude_local_address_required,
                    exclude_foreign_address_required: exclude_foreign_address_required,
                    beta: beta,
                    near_number: near_number,
                    near_lat_long: near_lat_long,
                    distance: distance,
                    in_postal_code: in_postal_code,
                    in_region: in_region,
                    in_rate_center: in_rate_center,
                    in_lata: in_lata,
                    in_locality: in_locality,
                    fax_enabled: fax_enabled,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MobileInstance records from the API.
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
              # Retrieve a single page of MobileInstance records from the API.
              # Request is executed immediately.
              # @param [String] area_code The area_code
              # @param [String] contains The contains
              # @param [Boolean] sms_enabled The sms_enabled
              # @param [Boolean] mms_enabled The mms_enabled
              # @param [Boolean] voice_enabled The voice_enabled
              # @param [Boolean] exclude_all_address_required The exclude_all_address_required
              # @param [Boolean] exclude_local_address_required The
              #   exclude_local_address_required
              # @param [Boolean] exclude_foreign_address_required The
              #   exclude_foreign_address_required
              # @param [Boolean] beta The beta
              # @param [String] near_number The near_number
              # @param [String] near_lat_long The near_lat_long
              # @param [String] distance The distance
              # @param [String] in_postal_code The in_postal_code
              # @param [String] in_region The in_region
              # @param [String] in_rate_center The in_rate_center
              # @param [String] in_lata The in_lata
              # @param [String] in_locality The in_locality
              # @param [Boolean] fax_enabled The fax_enabled
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MobileInstance
              def page(area_code: :unset, contains: :unset, sms_enabled: :unset, mms_enabled: :unset, voice_enabled: :unset, exclude_all_address_required: :unset, exclude_local_address_required: :unset, exclude_foreign_address_required: :unset, beta: :unset, near_number: :unset, near_lat_long: :unset, distance: :unset, in_postal_code: :unset, in_region: :unset, in_rate_center: :unset, in_lata: :unset, in_locality: :unset, fax_enabled: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'AreaCode' => area_code,
                    'Contains' => contains,
                    'SmsEnabled' => sms_enabled,
                    'MmsEnabled' => mms_enabled,
                    'VoiceEnabled' => voice_enabled,
                    'ExcludeAllAddressRequired' => exclude_all_address_required,
                    'ExcludeLocalAddressRequired' => exclude_local_address_required,
                    'ExcludeForeignAddressRequired' => exclude_foreign_address_required,
                    'Beta' => beta,
                    'NearNumber' => near_number,
                    'NearLatLong' => near_lat_long,
                    'Distance' => distance,
                    'InPostalCode' => in_postal_code,
                    'InRegion' => in_region,
                    'InRateCenter' => in_rate_center,
                    'InLata' => in_lata,
                    'InLocality' => in_locality,
                    'FaxEnabled' => fax_enabled,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                MobilePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MobileInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of MobileInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                MobilePage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.MobileList>'
              end
            end

            class MobilePage < Page
              ##
              # Initialize the MobilePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [MobilePage] MobilePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MobileInstance
              # @param [Hash] payload Payload response from the API
              # @return [MobileInstance] MobileInstance
              def get_instance(payload)
                MobileInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    country_code: @solution[:country_code],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.MobilePage>'
              end
            end

            class MobileInstance < InstanceResource
              ##
              # Initialize the MobileInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The 34 character string that uniquely identifies
              #   your account.
              # @param [String] country_code The ISO Country code to lookup phone numbers for.
              # @return [MobileInstance] MobileInstance
              def initialize(version, payload, account_sid: nil, country_code: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'friendly_name' => payload['friendly_name'],
                    'phone_number' => payload['phone_number'],
                    'lata' => payload['lata'],
                    'locality' => payload['locality'],
                    'rate_center' => payload['rate_center'],
                    'latitude' => payload['latitude'].to_f,
                    'longitude' => payload['longitude'].to_f,
                    'region' => payload['region'],
                    'postal_code' => payload['postal_code'],
                    'iso_country' => payload['iso_country'],
                    'address_requirements' => payload['address_requirements'],
                    'beta' => payload['beta'],
                    'capabilities' => payload['capabilities'],
                }
              end

              ##
              # @return [String] The friendly_name
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [String] The phone_number
              def phone_number
                @properties['phone_number']
              end

              ##
              # @return [String] The lata
              def lata
                @properties['lata']
              end

              ##
              # @return [String] The locality
              def locality
                @properties['locality']
              end

              ##
              # @return [String] The rate_center
              def rate_center
                @properties['rate_center']
              end

              ##
              # @return [String] The latitude
              def latitude
                @properties['latitude']
              end

              ##
              # @return [String] The longitude
              def longitude
                @properties['longitude']
              end

              ##
              # @return [String] The region
              def region
                @properties['region']
              end

              ##
              # @return [String] The postal_code
              def postal_code
                @properties['postal_code']
              end

              ##
              # @return [String] The iso_country
              def iso_country
                @properties['iso_country']
              end

              ##
              # @return [String] The address_requirements
              def address_requirements
                @properties['address_requirements']
              end

              ##
              # @return [Boolean] The beta
              def beta
                @properties['beta']
              end

              ##
              # @return [String] The capabilities
              def capabilities
                @properties['capabilities']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.MobileInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Api.V2010.MobileInstance>"
              end
            end
          end
        end
      end
    end
  end
end