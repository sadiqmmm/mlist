# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mlist}
  s.version = "0.1.20"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Williams"]
  s.date = %q{2010-09-01}
  s.description = %q{A Ruby mailing list library designed to be integrated into other applications.}
  s.email = %q{adam@thewilliams.ws}
  s.extra_rdoc_files = [
    "README",
     "TODO"
  ]
  s.files = [
    "CHANGELOG",
     "Gemfile",
     "README",
     "Rakefile",
     "TODO",
     "VERSION.yml",
     "lib/mlist.rb",
     "lib/mlist/email.rb",
     "lib/mlist/email_post.rb",
     "lib/mlist/email_server.rb",
     "lib/mlist/email_server/base.rb",
     "lib/mlist/email_server/default.rb",
     "lib/mlist/email_server/fake.rb",
     "lib/mlist/email_server/imap.rb",
     "lib/mlist/email_server/pop.rb",
     "lib/mlist/email_server/smtp.rb",
     "lib/mlist/email_subscriber.rb",
     "lib/mlist/list.rb",
     "lib/mlist/mail_list.rb",
     "lib/mlist/manager.rb",
     "lib/mlist/manager/database.rb",
     "lib/mlist/manager/notifier.rb",
     "lib/mlist/message.rb",
     "lib/mlist/server.rb",
     "lib/mlist/thread.rb",
     "lib/mlist/util.rb",
     "lib/mlist/util/email_helpers.rb",
     "lib/mlist/util/header_sanitizer.rb",
     "lib/mlist/util/quoting.rb",
     "lib/mlist/util/tmail_builder.rb",
     "lib/mlist/util/tmail_methods.rb",
     "lib/pop_ssl.rb",
     "rails/init.rb"
  ]
  s.homepage = %q{http://github.com/aiwilliams/mlist}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Ruby mailing list library designed to be integrated into other applications.}
  s.test_files = [
    "spec/fixtures/schema.rb",
     "spec/integration/date_formats_spec.rb",
     "spec/integration/imap_email_server_spec.rb",
     "spec/integration/mlist_spec.rb",
     "spec/integration/pop_email_server_spec.rb",
     "spec/integration/proof_spec.rb",
     "spec/matchers/equal_tmail.rb",
     "spec/matchers/have_address.rb",
     "spec/matchers/have_header.rb",
     "spec/models/email_post_spec.rb",
     "spec/models/email_server/base_spec.rb",
     "spec/models/email_spec.rb",
     "spec/models/mail_list_spec.rb",
     "spec/models/message_spec.rb",
     "spec/models/thread_spec.rb",
     "spec/models/util/email_helpers_spec.rb",
     "spec/models/util/header_sanitizer_spec.rb",
     "spec/models/util/quoting_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

