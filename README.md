# Tic-Tac-Test

## About
Tic-Tac-Test is a Tic-Tac-Toe application that was created using Test-Driven Development.
This was my first time coding with tests and also one of the first few apps that
I ever built. It was a great learning experience and was truly eye opening. If you've
never tried it (either test-driven development or building a tic-tac-toe app), I'd
recommend it. Whether you actually play the game or just read the code, I hope you
enjoy it!

## How to Play
After you use git to clone the app or download it some other way, navigate to the tic_tac_test
directory using a command line application. Once there, navigate to the lib directory (you can
use the 'cd' command if you're using a unix system, like a mac with OS X or linux). Then
all you have to do is enter 'ruby play.rb' (without the quotes). The app will then display
the rules on the screen. To answer the games questions, simply respond with a number
that corresponds to your preference and hit enter or return. Your responses should be numbers
or a yes or no (y and n are also acceptable for yes or no questions).

## Testing
This app makes use of the built in testing library for ruby, called test/unit. You can either
run all of the tests related to a certain class by navigating through terminal or your
command line client of choice from the app's root directory ('tic_tac_test') into the 'test'
directory. From there you can use the ruby command to run either the test file for a particular
class or you can run all tests by running the all_test.rb file.

**Note: The above is assuming you haven't moved the files inside of the tic_tac_test directory or
in any of its sub directories.**

**Also note:** When you run the human_player_test.rb file (or the all_test.rb file since it's
included), the test results will look something like this:

```ruby
Run options:

Running tests:

.....Please enter a number that corresponds to an unmarked space.
(psst, in case you forgot, you're X's)
.Please enter a number that corresponds to an unmarked space.
(psst, in case you forgot, you're X's)
.Invalid choice: only numbers that are greater than 0 or less than 10
that correspond to an unmarked space are accepted
..Invalid choice: only numbers that are greater than 0 or less than 10
that correspond to an unmarked space are accepted
.

Finished tests in 0.001613s, 6199.6280 tests/s, 6199.6280 assertions/s.

10 tests, 10 assertions, 0 failures, 0 errors, 0 skips
```

The tests all pass but since it's testing the part of the game that
interacts with the user by printing messages, it, well, prints messages.
Sadly, they disrupt the natural beauty of the dots letting you know the
tests passed.

## System Requirements
Ruby 1.9.3 is recommended. Ruby 2.0 should work since it's backwards compatible.
It hasn't been tested with Ruby 1.8.7 but I don't think there's anything
in there that's dependent on 1.9.3 or higher.

You'll also need a command line interface, equivilant to OS X's terminal.
