# Versioning Script

This bash script automates the versioning process of a Git repository based on Semantic Versioning (SemVer) principles.

## Script Logic

1. **Get Parameters:**
   - Parses command-line options using `getopts` to obtain the desired version type (`major`, `minor`, or `patch`).
  
2. **Get Current Version:**
   - Fetches the latest tags from the remote repository.
   - If no tags exist, sets the `CURRENT_VERSION` to 'v0.1.0'.
   - Outputs the current version.

3. **Parse Current Version:**
   - Splits the current version into an array using '.' as a separator.

4. **Update Version:**
   - Based on the specified version type (`major`, `minor`, or `patch`), increments the corresponding version number.
   - Creates a new tag with the updated version.

5. **Check Existing Tag:**
   - Checks if the commit has an existing tag.

6. **Tagging Process:**
   - If no tag exists for the commit, tags it with the new version.
   - Pushes the new tag to the remote repository.

7. **Set Output:**
   - Sets the GitHub Actions output variable `git-tag` with the newly created tag.

8. **Exit:**
   - Exits the script with a success code (0).

## Usage

To use this script, call it with the desired version type as an argument:

```bash
bash versioning-script.sh -v [major, minor, patch]
