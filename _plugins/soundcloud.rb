# frozen_string_literal: false

require 'nokogiri'
require 'open-uri'

module Jekyll
  module SoundCloud
    class SoundCloudTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @tracks = parse_tracks
      end

      def render(context)
        html = ''

        @tracks.each do |track|
          src = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{track[:id]}&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
          html << "<h3><a href='#{track[:url]}'>#{track[:name]}</a></h3>"
          html << "<iframe src='#{src}' width='100%' height='100' scrolling='no' frameborder='no'></iframe>"
        end

        html
      end

      private

      def parse_tracks
        base_url = 'https://soundcloud.com'
        tracks_url = URI::join(base_url, '/bitbear/tracks')
        tracks_source = URI.open(tracks_url)
        tracks_doc = Nokogiri::HTML(tracks_source)
        tracks_doc.css('section > article > h2 > a:first-of-type').map do |track_link|
          track_name = track_link.content
          track_href = track_link['href']
          track_url = URI::join(base_url, track_href)
          track_source = URI.open(track_url)
          track_doc = Nokogiri::HTML(track_source)
          track_id = track_doc.css('link[href^="ios-app://"]').map(&:track_id).first
          {
            :id => track_id,
            :name => track_name,
            :url => track_url
          }
        end
      end
    end
  end
end

module Nokogiri
  module XML
    class Element
      def track_id
        ios_app_regex = /sounds\:(\d+)/
        ios_link_href = self['href']
        match = ios_app_regex.match(ios_link_href)
        match.captures.first
      end
    end
  end
end

Liquid::Template.register_tag('soundcloud', Jekyll::SoundCloud::SoundCloudTag)
