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
    | ClickedRoster
    | ClickedAboutUs


view : Model -> Document Msg
view model =
    { title = "Convictus"
    , body =
        [ div
            [ flex
            , style "flex-flow" "column"
            , style "justify-content" "space-between"
            , style "font-family" "sans-serif"
            , background model.headerColour
            , style "width" "100%"
            , style "height" "100%"
            ]
            [ div
                [ flex
                , style "justify-content" "space-between"
                , pad "17px"
                , style "font-size" "27px"
                ]
                header
            , div [] [ content ]
            , div [] [ footer ]
            ]
        ]
    }


header : List (Html.Html Msg)
header =
    [ home, roster, aboutUs ]


home : Html.Html Msg
home =
    div
        [ flex
        , style "justify-content" "space-between"
        , pad "17px"
        , padL "7px"
        , onClick ClickedHome
        ]
        [ text "Convictus" ]


roster : Html.Html Msg
roster =
    div [] [ text "roster" ]


aboutUs : Html.Html Msg
aboutUs =
    div [] [ text "about us" ]


content : Html.Html Msg
content =
    div [] []


footer : Html.Html Msg
footer =
    div [] []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedHome ->
            ( { model | headerColour = "red" }, Cmd.none )

        ClickedRoster ->
            ( model, Cmd.none )

        ClickedAboutUs ->
            ( model, Cmd.none )


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


padL : String -> Html.Attribute msg
padL pixels =
    style "padding-left" pixels
