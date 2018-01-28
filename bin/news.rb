#!/usr/bin/env ruby

# http://d.hatena.ne.jp/maeharin/20130113/ruby_oneliner
require 'open-uri'
require 'nkf'

defined_sites = {
  'yahoo' => {
    'url'    => 'http://www.yahoo.co.jp',
    'regexp' => /topics.+?>([^<]+?)</
  },
  'hatena' => {
    'url'    => 'http://b.hatena.ne.jp/hotentry',
    'regexp' => /entry-link.+>(.+?)</
  },
  'naver' => {
    'url'    => 'http://matome.naver.jp',
    'regexp' => /matomename.+?-->(.+?)<!--/m
  },
  '2ch' => {
    'url'    => 'http://uni.2ch.net/newsplus',
    'regexp' => /<a.+?>\d+?:\s(.+?)</
  }
}

class Site
  attr_accessor :url, :regexp

  def initialize
    yield self
  end

  def fetch
    open(@url) do |f|
      f.read.scan(@regexp) {|m| puts NKF.nkf('-w', m.join)}
    end
  end
end

site_names = ARGV.empty? ? defined_sites.keys : ARGV
sites = []
site_names.each do |site_name|
  raise 'not defined' unless defined_sites.keys.include? site_name

  sites << Site.new do |s|
    s.url    = defined_sites[site_name]['url']
    s.regexp = defined_sites[site_name]['regexp']
  end
end

sites.map(&:fetch)

