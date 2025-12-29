#!/usr/bin/env python3
"""
Example Python module demonstrating theme scopes.

This docstring uses triple quotes which are scoped as comments.
"""

import os
import signal
from typing import List, Optional
from dataclasses import dataclass

# Constants (uppercase)
MAX_VALUE = 100
DEFAULT_NAME = "default"
SIGKILL = signal.SIGKILL  # Imported constant

# Language constants
NOTHING = None
IS_ENABLED = True
IS_DISABLED = False


@dataclass
class Example:
    """Example dataclass with fields."""

    name: str
    count: int = 0
    items: List[str] = None

    def __post_init__(self):
        if self.items is None:
            self.items = []

    def process(self, value: Optional[str] = None) -> bool:
        """Process a value and return success status."""
        if value is None:
            return False

        # String with escape sequences
        message = f"Processing: {value}\n"
        print(message)

        # Operators and comparisons
        result = self.count + 1 >= MAX_VALUE
        is_valid = value != "" and len(value) > 0

        return is_valid and not result


def main():
    # Regular variables
    local_var = 42
    text = "Hello, World!"

    # F-string with interpolation
    formatted = f"Value is {local_var} and text is '{text}'"

    # Create instance
    example = Example(name=DEFAULT_NAME)
    success = example.process(text)

    if success:
        print("Done!")
    elif example.count == 0:
        print("Empty")
    else:
        print("Failed")


if __name__ == "__main__":
    main()
