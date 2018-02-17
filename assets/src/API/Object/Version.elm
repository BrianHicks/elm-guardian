-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module API.Object.Version exposing (..)

import API.InputObject
import API.Interface
import API.Object
import API.Scalar
import API.Union
import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) API.Object.Version
selection constructor =
    Object.selection constructor


build : SelectionSet decodesTo API.Object.Build -> Field (Maybe decodesTo) API.Object.Version
build object =
    Object.selectionField "build" [] object (identity >> Decode.nullable)


compiler : Field String API.Object.Version
compiler =
    Object.fieldDecoder "compiler" [] Decode.string


insertedAt : Field API.Scalar.DateTime API.Object.Version
insertedAt =
    Object.fieldDecoder "insertedAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map API.Scalar.DateTime)


major : Field Int API.Object.Version
major =
    Object.fieldDecoder "major" [] Decode.int


minor : Field Int API.Object.Version
minor =
    Object.fieldDecoder "minor" [] Decode.int


patch : Field Int API.Object.Version
patch =
    Object.fieldDecoder "patch" [] Decode.int


updatedAt : Field API.Scalar.DateTime API.Object.Version
updatedAt =
    Object.fieldDecoder "updatedAt" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map toString, Decode.int |> Decode.map toString, Decode.bool |> Decode.map toString ] |> Decode.map API.Scalar.DateTime)