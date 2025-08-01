# 0010 - Removal of Implicit File Creation

## Status
Accepted

## Context
The `bin/create_challenge.sh` script was implicitly creating a placeholder `.ovpn` file, which went against the philosophy of explicit control.

## Decision
Removed the line that created the placeholder `.ovpn` file from `bin/create_challenge.sh`.

## Consequences
- Aligned with the explicit control philosophy.
- Reduced unnecessary file creation during challenge setup.
- Users are now responsible for providing their own `.ovpn` files when needed.
