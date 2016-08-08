module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, src)
import Html.App as App


type alias Model =
    {}


initialModel =
    {}


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div
        [ style [ ( "padding", "8px" ) ]
        ]
        [ viewCanvas
        , hr [] []
        , text <| toString model
        ]


viewCanvas : Html Msg
viewCanvas =
    div
        [ style
            [ ( "width", "250px" )
            , ( "height", "250px" )
            , ( "border", "2px solid black" )
            ]
        ]
        [ img [ src "https://pixabay.com/static/uploads/photo/2016/06/16/14/45/leaf-1461418_960_720.jpg" ] [] ]


main =
    App.program
        { init = ( initialModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = view
        }
