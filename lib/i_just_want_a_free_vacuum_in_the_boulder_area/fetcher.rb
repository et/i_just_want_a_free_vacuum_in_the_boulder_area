require 'craigslist'

module IJustWantAFreeVacuumInTheBoulderArea
  class Fetcher

    VACUUM_QUERIES = ['vacuum']

    def fetch
      Craigslist.city(:boulder).free.query('vacuum').fetch
    end
  end
end
