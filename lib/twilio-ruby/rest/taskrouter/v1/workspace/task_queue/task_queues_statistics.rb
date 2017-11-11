##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskQueueList < ListResource
            class TaskQueuesStatisticsList < ListResource
              ##
              # Initialize the TaskQueuesStatisticsList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @return [TaskQueuesStatisticsList] TaskQueuesStatisticsList
              def initialize(version, workspace_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid}
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/Statistics"
              end

              ##
              # Lists TaskQueuesStatisticsInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Time] end_date The end_date
              # @param [String] friendly_name The friendly_name
              # @param [String] minutes The minutes
              # @param [Time] start_date The start_date
              # @param [String] task_channel The task_channel
              # @param [String] split_by_wait_time The split_by_wait_time
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(end_date: :unset, friendly_name: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset, limit: nil, page_size: nil)
                self.stream(
                    end_date: end_date,
                    friendly_name: friendly_name,
                    minutes: minutes,
                    start_date: start_date,
                    task_channel: task_channel,
                    split_by_wait_time: split_by_wait_time,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams TaskQueuesStatisticsInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Time] end_date The end_date
              # @param [String] friendly_name The friendly_name
              # @param [String] minutes The minutes
              # @param [Time] start_date The start_date
              # @param [String] task_channel The task_channel
              # @param [String] split_by_wait_time The split_by_wait_time
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(end_date: :unset, friendly_name: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    end_date: end_date,
                    friendly_name: friendly_name,
                    minutes: minutes,
                    start_date: start_date,
                    task_channel: task_channel,
                    split_by_wait_time: split_by_wait_time,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields TaskQueuesStatisticsInstance records from the API.
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
              # Retrieve a single page of TaskQueuesStatisticsInstance records from the API.
              # Request is executed immediately.
              # @param [Time] end_date The end_date
              # @param [String] friendly_name The friendly_name
              # @param [String] minutes The minutes
              # @param [Time] start_date The start_date
              # @param [String] task_channel The task_channel
              # @param [String] split_by_wait_time The split_by_wait_time
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of TaskQueuesStatisticsInstance
              def page(end_date: :unset, friendly_name: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                    'FriendlyName' => friendly_name,
                    'Minutes' => minutes,
                    'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                    'TaskChannel' => task_channel,
                    'SplitByWaitTime' => split_by_wait_time,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                TaskQueuesStatisticsPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of TaskQueuesStatisticsInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of TaskQueuesStatisticsInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                TaskQueuesStatisticsPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.TaskQueuesStatisticsList>'
              end
            end

            class TaskQueuesStatisticsPage < Page
              ##
              # Initialize the TaskQueuesStatisticsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [TaskQueuesStatisticsPage] TaskQueuesStatisticsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of TaskQueuesStatisticsInstance
              # @param [Hash] payload Payload response from the API
              # @return [TaskQueuesStatisticsInstance] TaskQueuesStatisticsInstance
              def get_instance(payload)
                TaskQueuesStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid])
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.TaskQueuesStatisticsPage>'
              end
            end

            class TaskQueuesStatisticsInstance < InstanceResource
              ##
              # Initialize the TaskQueuesStatisticsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @return [TaskQueuesStatisticsInstance] TaskQueuesStatisticsInstance
              def initialize(version, payload, workspace_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'cumulative' => payload['cumulative'],
                    'realtime' => payload['realtime'],
                    'task_queue_sid' => payload['task_queue_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                }
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [Hash] The cumulative
              def cumulative
                @properties['cumulative']
              end

              ##
              # @return [Hash] The realtime
              def realtime
                @properties['realtime']
              end

              ##
              # @return [String] The task_queue_sid
              def task_queue_sid
                @properties['task_queue_sid']
              end

              ##
              # @return [String] The workspace_sid
              def workspace_sid
                @properties['workspace_sid']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Taskrouter.V1.TaskQueuesStatisticsInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Taskrouter.V1.TaskQueuesStatisticsInstance>"
              end
            end
          end
        end
      end
    end
  end
end