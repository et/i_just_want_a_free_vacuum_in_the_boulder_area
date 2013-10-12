require 'test_helper'

class FetcherTest < MiniTest::Unit::TestCase
  def setup
    @fetcher = IJustWantAFreeVacuumInTheBoulderArea::Fetcher.new
    VCR.insert_cassette('fetches_a_list_of_vacuums')
  end

  def teardown
    VCR.eject_cassette
  end

  def test_fetch_returns_array
    assert_instance_of Array, @fetcher.fetch
  end

  def test_fetch_href_of_a_query
    query = @fetcher.fetch.first
    refute_nil query['href']
  end
end
