require 'craigslist'

module IJustWantAFreeVacuumInTheBoulderArea
  class Fetcher

    VACUUM_QUERIES = %w|vacuum vaccuum|

    # Queries the Boulder free section of craigslist for vacuums
    #
    # Returns an array of Craigslist::Persistable objects
    # See: https://github.com/gregstallings/craigslist
    def fetch
      VACUUM_QUERIES.collect { |query|
        Craigslist.city(:boulder).free.query(query).fetch
      }.flatten
    end

    # Fetches vacuum results and emails the links
    def fetch_and_email
      results = fetch
      unless results.empty?
        IJustWantAFreeVacuumInTheBoulderArea::Mailer.deliver_vacuum_links hrefs_for(results)
      end
    end

    # Parses hrefs for an array of results
    #
    # results - the Array of results
    #
    # Examples
    #
    #   hrefs_for [{ foo: 'bar', href: 'google.com' }, { baz: 'buz', href: 'yahoo.com' }]
    #   # => ['google.com', 'yahoo.com']
    #
    # Returns an Array of hrefs
    def hrefs_for results
      results.map { |hash|
        hash.select { |k, _|
          [:href].include? k
        }.values
      }.flatten
    end
  end
end
