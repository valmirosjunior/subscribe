# Sales Tax Receipt Generator

A Ruby application that calculates sales tax and generates receipts for shopping baskets.

## Prerequisites

- Ruby 3.4.5 (managed via asdf)
- Bundler

## Installation

```bash
bundle install
```

## How to Run

### From file:
```bash
bundle exec ruby bin/app < examples/input1.txt
```

### From stdin:
```bash
echo -e "2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85" | bundle exec ruby bin/app
```

### Interactive mode:
```bash
bundle exec ruby bin/app
# Type your input and press Ctrl+D when done
```

## Running Tests

```bash
bundle exec rspec
```

## Code Quality

This project uses RuboCop for code style checking:

```bash
# Check for offenses
bundle exec rubocop

# Auto-correct offenses
bundle exec rubocop -A
```

## Examples

The `examples/` directory contains sample input files:
- `examples/input1.txt`
- `examples/input2.txt`
- `examples/input3.txt`

Run them with:
```bash
bundle exec ruby bin/app < examples/input1.txt
```

