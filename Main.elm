module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, src)
import Html.App as App


type alias Model =
    { canvas : Size
    , frame : Frame
    }


type alias Size =
    { width : Int, height : Int }


type Frame
    = SingleImage { url : String }


initialModel : Model
initialModel =
    { canvas = { width = 100, height = 100 }
    , frame =
        SingleImage
            { url = "https://pixabay.com/static/uploads/photo/2014/12/22/19/59/macbook-577758_960_720.jpg"
            }
    }


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
        [ viewCanvas model.canvas model.frame
        , hr [] []
        , text <| toString model
        ]


viewCanvas : Size -> Frame -> Html Msg
viewCanvas size rootFrame =
    div
        [ style
            [ ( "width", toString size.width ++ "px" )
            , ( "height", toString size.height ++ "px" )
            , ( "border", "2px solid black" )
            ]
        ]
        [ viewFrame size rootFrame
        ]


viewFrame : Size -> Frame -> Html Msg
viewFrame size frame =
    case frame of
        SingleImage { url } ->
            div
                [ style
                    [ ( "height", toString size.height ++ "px" )
                    , ( "width", toString size.width ++ "px" )
                    , ( "background-image", "url(" ++ url ++ ")" )
                    , ( "background-size", "auto " ++ toString size.height ++ "px" )
                    ]
                ]
                []


main : Program Never
main =
    App.program
        { init = ( initialModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = view
        }
