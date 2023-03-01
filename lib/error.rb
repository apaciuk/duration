 class Error < StandardError
        attr_reader :response
    
        def initialize(response)
        @response = response
        super(message)
        end
    
        def message
        "#{response.status}: #{response.body}"
        end
 end
