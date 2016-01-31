# Sky Monkey
### TODO
* At the end of each day a job should kick off to mark any tickets invalid that have expired.
* call mark_invalid method after a boarding pass is used.
* Configure action_mailer to actually send emails using something like postmark or mandrill

* install RSpec and write tests

Requirements:

# Take-Home Rails Test - "Sky Monkey"

Time Commitment: __~4 hours__

## Goal

We would like to assess your understanding of Ruby on Rails database-backed web applications.

We would also like to assess your object oriented design and testing skills.

## Assignment

Implement a simple Rails 4 application for a helicopter ride ticket purchase system called "Sky Monkey".

## Specification

"Sky Monkey" is a hypothetical ticket sales application for helicopter sightseeing tours.

Customers go to the "Sky Monkey" mobile website on their smartphone, enter basic contact information, select how many tickets they would like for their party, pay for the tickets, and receive a Boarding Pass in the form of a QR code (or Apple Wallet Boarding Pass, etc.).

This Boarding Pass is scanned by a tour company representative to allow all passengers in a party to board a helicopter. Individual passengers do not get a boarding pass.

Helicopters run continuously and passengers are boarded on a first-come first-served basis.

Boarding Passes may only be used once.

Boarding Passes expire after 14 days.

The ticket price is $75 per passenger.

Sales tax is 8.875%.

## Views

The views for this application are described in order of the customer flow.

They should be implemented using Bootstrap standard CSS and controls.

### Splash

Show a Sky Monkey logo (pick anything, it doesn't matter)

Show a short explanation paragraph (a short sentence or two explaining the experience)

Show a "Buy Tickets" button.

### Customer Information

Collect Name and Email for a Customer.

Show validation errors if name or email are missing or email is invalid.

Show a button to "Continue to Payment Method"

### Ticket Quantity Selection

Select the number of tickets, up to 6, and show the ticket subtotal. For example, if tickets cost $10, and the customer selects 5 tickets, show a subtotal of $50.

### Payment Method

Enter a credit card number, expiration month, expiration year, and CVC code.

Show validation errors. All card fields must be present. The Expiration Month and Year must be in the future.

Show a button to "Continue to Checkout"

### Checkout

Show the number of tickets, the subtotal of tickets, the tax to be collected, and the amount due.

Show the last 4 digits of the credit card number for the payment method selected.

Show a button to "Purchase Tickets"

### Confirmation

Submit payment to the `PaymentProcessorSimulator` (see below).

Store customer, transaction, and boarding pass information as needed in a database.

You should store enough information to compile daily and monthly sales reports (reports are beyond the scope of this task, but the information should be there).

You should store enough information to check if a given boarding pass is valid and when scanned, marked as used.

Send a confirmation email to the customer with a basic summary of their purchase and their boarding pass.

Show a success message.

Show a boarding pass (either a QR code or a simple unique code as described below)

## Simplifications

* Create a `PaymentProcessorSimulator` class that always succeeds, trading Credit Card information for a `PaymentToken` string that should be stored for later use (e.g. refunds).

* Boarding Pass QR code generation is not necessary. As an alternative, generate a short unique alphanumeric code, e.g. "ABCD1234"

## Tests

Please provide basic unit tests for the models and controllers used.

If time permits, please provide integration tests that exercise an end-to-end purchase session.

## Submission

Please submit the Rails project as a zip file.

The project tests and server should be easily runnable once extracted.
