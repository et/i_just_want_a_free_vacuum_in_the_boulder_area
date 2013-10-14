require 'pony'

module IJustWantAFreeVacuumInTheBoulderArea
  class Mailer

    # Delivers an email of vacuum hrefs
    #
    # hrefs - an Array of hrefs
    def self.deliver_vacuum_hrefs hrefs
      Pony.mail(to: 'eric.l.m.thomas@gmail.com', from: 'eric.l.m.thomas@gmail.com', subject: 'Free Vacuums')
      #, body: hrefs.join("\n")
    end
  end
end
