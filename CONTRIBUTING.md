# Contributing

Thank you for wanting to contribute.

## Code contributions

To start coding, you'll need:

- a minimum of [Ruby](https://ruby-lang.org/) v2.7.7, though we do encourage
using the latest LTS release

Then:

1. [Fork and clone][] the orbacle repository.

### Commits

We follow the conventional commit standard for our commit messages. You can read
more about this at the conventional commit [website][]

### Run tests

Next, you'll want to run the tests using
```bash
rake
```

However, this runs all 500+ unit tests and also linting.


You can use rspec to run tests for just a chosen set of files (which you'll
want to do during development). For example, to run the tests for just the `foo`
and `bar` features:

```bash
rspec foo bar
```

You can find more information about testing on the [RSpec documentation][]

  [Fork and clone]: https://guides.github.com/activities/forking/
  [Ruby]: https://ruby-lang.org/
  [website]: https://www.conventionalcommits.org/en/v1.0.0/
  [RSpec website]: https://rspec.info/documentation/
