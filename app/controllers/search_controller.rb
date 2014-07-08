require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'

class SearchController < ApplicationController


  def index
    #Complete the DuckDuckGo scraper: write a function that takes a search string as input and returns a list of results scraped fromduckduckgo.com.
    @search_term = params[:search_term]
    @search_term.sub!(" ","+")
    #Wrap that in an API: I should be able to make an HTTP request containing my query and get list of DuckDuckGo search results as JSON.
    @doc = JSON.parse(Nokogiri::HTML(open("https://duckduckgo.com/?q=#{@search_term}&format=json")))
    #A topic summary from the DuckDuckGo API if it's available (see https://duckduckgo.com/api)
    @topic_summary = JSON.parse(HTTParty.get("http://api.duckduckgo.com/?q=#{@search_term}&format=json&pretty=1"))
  end
end