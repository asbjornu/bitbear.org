# frozen_string_literal: true

require 'its'
require 'liquid'
require_relative '../_plugins/date'

describe Jekyll::DateTag do
  subject(:date) { described_class.parse('date', input, nil, Liquid::ParseContext.new) }

  context 'valid dates' do
    let(:input) { '2018-01-01' }
    its(:raw) { is_expected.to eq('date 2018-01-01') }
    its(:render, Liquid::Context.new({ 'page' => { 'date' => '2020-08-23' } })) {
      is_expected.to eq('<abbr title="2018-01-01">Monday, January 1st 2018</abbr>')
    }
  end

  context 'nil input date, valid page date' do
    let(:input) { nil }
    its(:raw) { is_expected.to eq('date ') }
    its(:render, Liquid::Context.new({ 'page' => { 'date' => '2020-08-23' } })) {
      is_expected.to eq('<abbr title="2020-08-23">Sunday, August 23rd 2020</abbr>')
    }
  end

  context 'nil date' do
    let(:input) { nil }
    its(:raw) { is_expected.to eq('date ') }
    its(:render, Liquid::Context.new({ 'page' => { 'date' => nil } })) {
      is_expected.to be_empty
    }
  end

  context 'invalid date' do
    let(:input) { 'abc' }
    its(:raw) { is_expected.to eq('date abc') }

    its(:render, Liquid::Context.new({ 'page' => { 'date' => 'abc' } })) {
      is_expected.to be_empty
    }
  end
end
