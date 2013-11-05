# -*- encoding: utf-8 -*-
# stub: adzap-ar_mailer 2.1.10 ruby lib

Gem::Specification.new do |s|
  s.name = "adzap-ar_mailer"
  s.version = "2.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Hodel", "Adam Meehan"]
  s.date = "2011-11-09"
  s.description = "Even delivering email to the local machine may take too long when you have to send hundreds of messages.  ar_mailer allows you to store messages into the database for later delivery by a separate process, ar_sendmail."
  s.email = "adam.meehan@gmail.com"
  s.executables = ["ar_sendmail"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "README.rdoc"]
  s.files = ["bin/ar_sendmail", "History.txt", "LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/adzap/ar_mailer"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "seattlerb"
  s.rubygems_version = "2.1.9"
  s.summary = "A two-phase delivery agent for ActionMailer"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 1.5.0"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
    else
      s.add_dependency(%q<minitest>, [">= 1.5.0"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 1.5.0"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
  end
end
