module Main exposing (..)

import API.Object
import API.Object.Package as Package
import API.Object.Version as Version
import API.Query as Query
import API.Scalar
import Graphqelm.Document as Document
import Graphqelm.Field as Field
import Graphqelm.Http
import Graphqelm.Operation exposing (RootQuery)
import Graphqelm.SelectionSet exposing (SelectionSet, with)
import Html exposing (Html)


type alias PackageResponse =
    { name : String
    , source : String
    , versions : List VersionResponse
    }


package : SelectionSet PackageResponse API.Object.Package
package =
    Package.selection PackageResponse
        |> with Package.name
        |> with Package.source
        |> with (Package.versions version)


type alias VersionResponse =
    { major : Int
    , minor : Int
    , patch : Int
    , compiler : String
    }


version : SelectionSet VersionResponse API.Object.Version
version =
    Version.selection VersionResponse
        |> with Version.major
        |> with Version.minor
        |> with Version.patch
        |> with Version.compiler


allPackages : SelectionSet (List PackageResponse) RootQuery
allPackages =
    Query.selection identity
        |> with (Query.packages package)


type alias Model =
    Result Graphqelm.Http.Error (List PackageResponse)


type Msg
    = GotResponse Model


init : ( Model, Cmd Msg )
init =
    ( Ok []
    , allPackages
        |> Graphqelm.Http.queryRequest "/api/graphql"
        |> Graphqelm.Http.send GotResponse
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update (GotResponse new) _ =
    ( new, Cmd.none )


view : Model -> Html Msg
view model =
    Html.text <| toString model


main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions =
            \_ -> Sub.none
        }
