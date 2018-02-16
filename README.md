# Guardian

This is gonna be a pre-publish server for Elm packages when it grows up.
Stuff like:

- classic validations like
  - is the `elm-package.json` good?
  - is the version bump correct?
  - does it not contain privileged code (native/kernel), or code meant for apps only (ports)?
- run the tests makes sure they pass
  - eventually: run the tests for downstream packages, make sure those pass when upgraded (if non-major version.)
- remove non-essential assets for code downloads (images, test code, etc)

## Developin'

This is an Elixir/Phoenix project, with an Elm frontend (because of course.)
The backend does a bunch of validations and exposes it to the frontend via GraphQL.
This is not all set up yet, and if you need instructions please ping Brian so he updates this doc.

But basically for the backend:

- [install Elixir](https://elixir-lang.org/install.html) (hint: `brew install elixir`)
- `mix deps.get`
- `mix phoenix.server`

## TODO

- [ ] add build request endpoint (HTTP)
- [ ] store build requests
- [ ] provide build requests to the frontend (graphql / absinthe)
- [ ] come back and figure out what's next (probably start validating stuff)
