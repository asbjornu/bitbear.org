# frozen_string_literal: false

require 'bytesize'

module Jekyll
  # Filters for working with Jekyll::Page objects
  module LiquidFilters
    def children_of(all_pages, parent)
      all_pages.select { |p| child_of?(p, parent) }
    end

    def file_size(input)
      ByteSize.new(input).to_s
    end

    def thousands_separated(input, separator = '.')
      input.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{separator}")
    end

    private

    def child_of?(child, parent)
      parent_path = parent['path']
      child_path = child.path

      # Exclude 'index.md' from becoming a child of itself
      return false if parent_path == child_path

      # Remove 'index.md' from the parent path
      parent_path = parent_path.split('index.md', 2).first

      child_path.start_with? parent_path
    end
  end
end

Liquid::Template.register_filter Jekyll::LiquidFilters
