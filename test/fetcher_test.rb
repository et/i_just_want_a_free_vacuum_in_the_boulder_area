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

  def test_hrefs_for
    results = [{ foo: 'bar', href: 'google.com' }, { baz: 'buz', href: 'yahoo.com' }]

    hrefs = @fetcher.hrefs_for results

    assert_equal hrefs, ['google.com', 'yahoo.com']
  end
end
