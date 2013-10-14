require 'test_helper'

class MailerTest < MiniTest::Unit::TestCase
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  def test_deliver_vacuum_hrefs
    hrefs = %w[http://boulder.craigslist.org/zip/4092887445.html
               http://boulder.craigslist.org/zip/4092457326.html
               http://boulder.craigslist.org/zip/4084476246.html]

    email = IJustWantAFreeVacuumInTheBoulderArea::Mailer.deliver_vacuum_hrefs hrefs
    skip "Why does Pony return an Array rather than a single Mail object?"
    assert_must deliver_to('eric.l.m.thomas@gmail.com'), email
  end
end
