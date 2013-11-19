module BellyPlatform
  class String
    class << self
      def validate(type, value)
        # return true if value not present
        return true unless value.present?

        # added to patch broken timestamps in the iOS v3 release
        value.gsub!(/ pm.| am./, '.') if type == 'timestamp'

        case type
        when 'integer', 'int'
          !!(value.to_s =~ /^-?\d*(,\d*)*$/)
        when 'boolean'
          BellyPlatform::Boolean.is_boolean?(value)
        when 'date'
          !!(value =~ /\d{4}-\d{2}-\d{2}/)
        when 'timestamp'
          !!(value =~ /^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}($|(\.\d+)$))|^(\d{10})$/)
        when 'double'
          !!(value.to_s =~ /^-?\d*.\d*$/)
        when 'array_of_integers', 'array_of_ints'
          value = value.split(',') unless value.is_a?(Array)
          value.is_a?(Array) && value.all?{|i| !!(i =~ /^\d*(,\d*)*$/)}
        when 'array_of_strings'
          value = value.split(',') unless value.is_a?(Array)
          value.is_a?(Array) && value.all?{|i| !!(i =~ /^[.\d\w-][.\d\w-]*(,[.\d\w-][.\d\w-]*)*$/)}
        when 'snake_case'
          !!(value =~ /^[a-zA-Z0-9_-]+$/)
        when 'geopoint'
          !!(value =~ /^\[-?\d*(.\d*)\, ?-?\d*(.\d*)\]$/)
        when 'string'
          !value.nil?
        end
      end

      def coerce(type, value)
        # if value is nil or "", just return value
        return value unless value.present?

        # added to patch broken timestamps in the iOS v3 release
        if(type == 'timestamp' && !value.is_a?(Integer))
          begin
            value = Time.parse(value).to_i
          rescue ArgumentError
          end
        end

        case type
        when 'integer', 'int'
          value.to_i
        when 'boolean'
          BellyPlatform::Boolean.convert(value)
        when 'double'
          value.to_f
        when 'array_of_integers', 'array_of_ints'
          value = value.split(',') unless value.is_a?(Array)
          value.map{|v| v.to_i}
        when 'array_of_strings'
          value = value.split(',') unless value.is_a?(Array)
          value
        when 'timestamp'
          if !!(value.to_s =~ /^(\d{10})$/)
            Time.at(value.to_i).to_s(:hadoop)
          elsif !!(value =~ /^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}($|(\.\d+)$))/)
            Time.parse(value).to_s(:hadoop)
          end
        else
          value
        end
      end
    end
  end
end