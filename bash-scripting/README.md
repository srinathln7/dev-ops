# `"$@"` vs `"$*"`
The `"$@"` symbol in a shell script is a special variable that represents all the positional parameters (arguments) passed to the script or function. It preserves the integrity of each argument, including spaces and special characters, by treating each argument as a separate quoted string.

## Detailed Explanation

- **`"$@"`**: Expands to all the positional parameters, starting from `$1`, `$2`, and so on. Each parameter is quoted separately, which means each argument is treated as a distinct word, preserving spaces and special characters within each argument.

### Examples

1. **Using `"$@"` in a Script**

   Suppose you have a script named `example.sh`:

   ```sh
   #!/bin/bash
   echo "Arguments received:"
   for arg in "$@"; then
     echo "$arg"
   done
   ```

   If you run the script with multiple arguments:

   ```sh
   ./example.sh "first arg" second "third arg with spaces"
   ```

   The output will be:

   ```
   Arguments received:
   first arg
   second
   third arg with spaces
   ```

   Each argument is preserved as passed, including spaces within quotes.

2. **Difference Between `"$@"` and `$*`**

   - `"$@"` treats each quoted argument as a separate entity.
   - `$*` combines all arguments into a single string, separated by the first character of the `IFS` (Internal Field Separator) variable (usually a space).

   Let's modify the script to demonstrate the difference:

   ```sh
   #!/bin/bash
   echo "Using \$@:"
   for arg in "$@"; then
     echo "$arg"
   done

   echo "Using \$*:"
   for arg in $*; then
     echo "$arg"
   done
   ```

   Running the script with the same arguments:

   ```sh
   ./example.sh "first arg" second "third arg with spaces"
   ```

   The output will be:

   ```
   Using $@:
   first arg
   second
   third arg with spaces
   Using $*:
   first
   arg
   second
   third
   arg
   with
   spaces
   ```

   Here, `$*` splits arguments on spaces, leading to unexpected behavior compared to `"$@"`.

## Summary

- `"$@"` is used to handle all positional parameters while preserving each parameter as a distinct word.
- It is particularly useful in loops and when passing arguments to functions or other commands within a script.
- `"$@"` ensures that arguments with spaces or special characters are properly handled as individual entities, avoiding potential issues with argument splitting.
