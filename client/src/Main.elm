module Main exposing (..)

import Browser exposing (Document, document)
import Html exposing (div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Platform.Sub exposing (none)



-- MAIN


main : Program () Model Msg
main =
    document
        { init = init -- init : flags -> (model, Cmd msg)
        , view = view -- view : model -> Document msg
        , update = update -- update : msg -> model -> (model, Cmd msg)
        , subscriptions = subscriptions -- subscriptions : model -> Sub msg
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { player = "lobes"
      , score = 0
      , headerColour = "purple"
      }
    , Cmd.none
    )



-- MODEL


type alias Model =
    { player : String
    , score : Int
    , headerColour : String
    }


type Msg
    = ClickedHome
    | ClickedKrew
    | ClickedAboutUs


view : Model -> Document Msg
view model =
    { title = "Convictus"
    , body =
        [ div
            [ flex
            , style "justify-content" "space-between"
            , style "flex-flow" "column"
            , style "font-family" "Verdana"
            , background model.headerColour
            , style "width" "100%"
            , style "height" "100vh"
            ]
            [ div
                [ flex
                , style "justify-content" "space-between"
                , style "font-size" "47px"
                , style "height " "17%"
                , background "green"
                , style "border-bottom" "7px solid black"
                ]
                header
            , div
                [ flex
                , style "justify-content" "center"
                , style "align-items" "center"
                , style "flex-flow" "column"
                , style "font-size" "47px"
                , style "height " "17%"
                ]
                [ content ]
            , div
                [ flex
                , background "green"
                , style "justify-content" "center"
                , style "align-items" "center"
                , style "font-size" "47px"
                , style "border-top" "7px solid black"
                , style "font-style" "italic"
                ]
                [ footer ]
            ]
        ]
    }


header : List (Html.Html Msg)
header =
    [ div
        [ onClick ClickedHome
        , pad "7px"
        , style "margin" "17px"
        , style "border" "3px solid black"
        , style "border-radius" "17px"
        ]
        [ text "Convictus" ]
    , div
        [ onClick ClickedKrew
        , pad "7px"
        , style "margin" "17px"
        , style "border" "3px solid black"
        , style "border-radius" "17px"
        ]
        [ text "krew" ]
    , div
        [ onClick ClickedAboutUs
        , pad "7px"
        , style "margin" "17px"
        , style "border" "3px solid black"
        , style "border-radius" "17px"
        ]
        [ text "about us" ]
    ]


content : Html.Html Msg
content =
    div
        [ flex
        , background "yellow"
        ]
        [ text "Content" ]


footer : Html.Html Msg
footer =
    div
        [ flex
        , style "margin" "7px"
        , style "font-size" "37px"
        , style "align-items" "center"
        ]
        [ text
            "-- we're so good it's criminal"
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedHome ->
            ( { model | headerColour = "red" }, Cmd.none )

        ClickedKrew ->
            ( { model | headerColour = "pink" }, Cmd.none )

        ClickedAboutUs ->
            ( { model | headerColour = "blue" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    none



-- CSS


flex : Html.Attribute Msg
flex =
    style "display" "flex"


background : String -> Html.Attribute msg
background colour =
    style "background-color" colour


pad : String -> Html.Attribute msg
pad pixels =
    style "padding" pixels
