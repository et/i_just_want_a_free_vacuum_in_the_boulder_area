require 'craigslist'

module IJustWantAFreeVacuumInTheBoulderArea
  class Fetcher

    VACUUM_QUERIES = %w|vacuum vaccuum|

    def fetch
      VACUUM_QUERIES.collect { |query|
        Craigslist.city(:boulder).free.query(query).fetch
      }.flatten
    end
  end
end
