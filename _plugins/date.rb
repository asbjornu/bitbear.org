# frozen_string_literal: true

module Jekyll
  # Implements the `date` tag.
  class DateTag < Liquid::Tag
    def initialize(tag_name, input, _)
      super

      @date = to_date(input)
    end

    def render(context)
      date = @date || to_date(lookup(context, 'page.date'))

      Jekyll.logger.debug 'DateTag:', "Rendering date: #{date}."

      return '' if date.nil?

      ordinal = ordinal(date.day)
      iso8601_date = date.strftime('%F')
      readable_date = date.strftime("%A, %B #{ordinal} %Y")

      "<abbr title=\"#{iso8601_date}\">#{readable_date}</abbr>"
    end

    private

    def ordinal(day)
      day.to_s +
        case day
        when 1, 21, 31
          'st'
        when 2, 22
          'nd'
        when 3, 23
          'rd'
        else
          'th'
        end
    end

    def to_date(date)
      if date.nil? || (date.respond_to?(:empty?) && date.empty?)
        Jekyll.logger.debug 'DateTag:', 'Date is nil or empty.'
        return nil
      end

      if date.is_a?(Date) || date.is_a?(Time)
        Jekyll.logger.debug 'DateTag:', "Date '#{date}' is already a Date or Time object."
        return date
      end

      Jekyll.logger.debug 'DateTag:', "Parsing date: #{date}."

      Date.parse(date)
    rescue StandardError => e
      Jekyll.logger.warn 'DateTag:', "Invalid date: #{date}. #{e}"
      nil
    end

    def lookup(context, name)
      Jekyll.logger.debug 'DateTag:', "Looking up '#{name}' in context."

      lookup = context
      name.split('.').each { |value| lookup = lookup[value] }

      Jekyll.logger.debug 'DateTag:', "Found '#{name}' with value: #{lookup}."

      lookup
    end
  end
end

Liquid::Template.register_tag('date', Jekyll::DateTag)
