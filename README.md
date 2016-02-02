# Sky Monkey

# Installation
* run `bundle install`
* run `rake db:migrate`
  * ruby 2.2.2 required - or update gemfile with any version of ruby that allows optional keyword arguments.

# Tests
* run `rspec`

### Not implemented
* At the end of each day a job should kick off to mark any tickets invalid that have expired.
* call mark_invalid method after a boarding pass is used.
* Configure action_mailer to actually send emails using something like postmark or mandrill
