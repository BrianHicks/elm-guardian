# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Guardian.Repo.insert!(%Guardian.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Guardian.Repo
alias Guardian.Packages.{Package, Version}

parser = %Package{name: "elm-tools/parser", source: "https://github.com/elm-tools/parser"} |> Repo.insert!
%Version{package: parser, major: 2, minor: 0, patch: 0, compiler: "0.18"} |> Repo.insert!
%Version{package: parser, major: 2, minor: 0, patch: 1, compiler: "0.18"} |> Repo.insert!

primitives = %Package{name: "elm-tools/parser-primitives", source: "https://github.com/elm-tools/parser-primitives"} |> Repo.insert!
%Version{package: primitives, major: 1, minor: 0, patch: 0, compiler: "0.18"} |> Repo.insert!

