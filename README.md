# npm-version step

Executes the `npm version` command to bump up the current npm package version..

### type
- type: string
- optional: true
- description: Semver bump type.
- example: `type: [patch|minor|major]`

### message
- type: string
- optional: true
- description: Commit message passed through to npm version
- example: `type: [patch|minor|major]`

## Example

    - npm-version
        type: patch
        message: automatic version bump by wercker.

# License

The MIT License (MIT)