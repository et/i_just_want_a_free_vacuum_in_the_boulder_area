require 'test_helper'

class FetcherTest < MiniTest::Unit::TestCase
  def setup
    @fetcher = IJustWantAFreeVacuumInTheBoulderArea::Fetcher.new
  end

  def test_fetch_returns_array
    VCR.use_cassette('fetches_a_list_of_vacuums') do
      assert_instance_of Array, @fetcher.fetch
    end
  end
end
