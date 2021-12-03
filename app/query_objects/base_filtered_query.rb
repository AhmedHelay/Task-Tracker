class BaseFIlteredQuery
    ALLOWED_PARAMS = []

    def initialize(realtion, options = {})
        @realtion = realtion
        @options = sanitized_filter_params(options)
    end

    def all 
        options.reduce(realtion) do |relation , (key, value)|
            public_send("by_#{key}", relation, value)
        end
    end

    private 

    def sanitized_filter_params(params)
        params
            .to_h
            .deep_symbolize_keys
            .reject { k,v| !self.class::ALLOWED_PARAMS.include?(k) ||  v.to_s.blank? }
    end

    attr_reader :relation, :options
end