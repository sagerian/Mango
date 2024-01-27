module Main exposing (..)

import Browser exposing (Document, document)
import Html exposing (Html, a, div, li, pre, text)
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
      , content = homeContent
      }
    , Cmd.none
    )



-- MODEL


type alias Model =
    { player : String
    , score : Int
    , headerColour : String
    , content : String
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
            [ style "display" "flex"
            , style "flex-direction" "column"
            , style "height" "100vh"
            , style "width" "100vw"
            , style "font-family" "Verdana"
            ]
            [ header
            , content model
            , footer
            ]
        ]
    }


header : Html Msg
header =
    div
        [ style "flex" "0 1 auto" ]
        [ div
            [ flex
            , style "justify-content" "space-between"
            , style "font-size" "47px"
            , background "green"
            , style "border-bottom" "7px solid black"
            ]
            [ div
                [ onClick ClickedHome
                , style "cursor" "pointer"
                , pad "7px"
                , style "margin" "17px"
                , style "border" "3px solid black"
                , style "border-radius" "17px"
                ]
                [ text "Convictus" ]
            , div
                [ onClick ClickedKrew
                , style "cursor" "pointer"
                , pad "7px"
                , style "margin" "17px"
                , style "border" "3px solid black"
                , style "border-radius" "17px"
                ]
                [ text "krew" ]
            , div
                [ onClick ClickedAboutUs
                , style "cursor" "pointer"
                , pad "7px"
                , style "margin" "17px"
                , style "border" "3px solid black"
                , style "border-radius" "17px"
                ]
                [ text "about us" ]
            ]
        ]


content : Model -> Html Msg
content model =
    div
        [ style "flex" "1 1 auto"
        , style "overflow-y" "auto"
        , style "background-color" model.headerColour
        ]
        [ pre
            [ flex
            , style "white-space" "pre-wrap"
            , style "justify-content" "center"
            , style "align-items" "center"
            , style "flex-flow" "column"
            ]
            [ div
                [ background "yellow"
                , style "width" "90%"
                , style "max-width" "600px"
                , style "overflow-y" "auto"
                , style "padding" "10px"
                , style "line-height" "1.6"
                , style "font-size" "27px"
                ]
                [ text model.content ]
            ]
        ]


footer : Html Msg
footer =
    div
        [ style "flex" "0 1 auto"

        -- Other footer styles...
        ]
        [ div
            [ flex
            , background "green"
            , style "justify-content" "center"
            , style "align-items" "center"
            , style "font-size" "47px"
            , style "border-top" "7px solid black"
            , style "font-style" "italic"
            ]
            [ div
                [ flex
                , style "margin" "7px"
                , style "font-size" "37px"
                , style "align-items" "center"
                , style "font-family" "ComicCodeLigatures" -- TODO: do this everywhere
                ]
                [ text
                    "-- we're so good it's criminal"
                ]
            ]
        ]



{-
   view : Model -> Document Msg
   view model =
       { title = "Convictus"
       , body =
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
           [ background "yellow"
           , style "width" "90%"
           , style "max-width" "600px"
           , style "overflow-y" "auto"
           , style "padding" "10px"
           , style "line-height" "1.6"
           , style "font-size" "27px"
           ]
           [ text krewContent ]


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
-}


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedHome ->
            ( { model | content = homeContent }, Cmd.none )

        ClickedKrew ->
            ( { model | content = krewContent }, Cmd.none )

        ClickedAboutUs ->
            ( { model | content = aboutUsContent }, Cmd.none )


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



-- CONTENT


homeContent : String
homeContent =
    """
DO
YOU
WANT
TO
PLAY
A
GAME...?
yeah
i'll
play

wassup
"""



{- lobes:
     Frequently spotted at LANs swearing at his PC, wondering why the fuck it doesn't show up on the network. Maintains the Convictus servers and databases.

   scubasteve:
     Has never installed HaX. Will vehemently deny any such accusation.

   I Am Purple:
     Never chooses purple. His favourite part is warmup because he gets to shoot all his teammates in the face.

   nuke the whales:
     Invents new and utterly indecipherable callouts each match. Then gaslights his teammates into feeling stupid for not knowing what the fuck he's taking about.

   jebediah:
     Resident apothecary. Sometimes his remedies make the team perform better. Sometimes worse. Mostly worse.

   toenibbler:
     Will always solo rush B when he has the bomb. Keeps going rogue trying to sneak up behind the enemy team. Because it worked that one time 10 years ago and how cool was that?

   Voodoo Foetus:
     Aggressively shit posts on forums during company time. Also manages the teams public image, often tied up doing damage control on social media.

   Flat-Face:
     Always late. Blames his brother. His tweets that start with "I'm not racist, but..." are usually the reason Voodoo Foetus is tied up doing damage control on social media.
-}


krewContent : String
krewContent =
    """
20 20 20 20 22 22 22 0A 6C 6F 62 65 73 3A 0A 20 20 46 72 65 71 75 65 6E 74 6C 79 20 73 70 6F 74 74 65 64 20 61 74 20 4C 41 4E 73 20 73 77 65 61 72 69 6E 67 20 61 74 20 68 69 73 20 50 43 2C 20 77 6F 6E 64 65 72 69 6E 67 20 77 68 79 20 74 68 65 20 66 75 63 6B 20 69 74 20 64 6F 65 73 6E 27 74 20 73 68 6F 77 20 75 70 20 6F 6E 20 74 68 65 20 6E 65 74 77 6F 72 6B 2E 20 4D 61 69 6E 74 61 69 6E 73 20 74 68 65 20 43 6F 6E 76 69 63 74 75 73 20 73 65 72 76 65 72 73 20 61 6E 64 20 64 61 74 61 62 61 73 65 73 2E 0A 0A 73 63 75 62 61 73 74 65 76 65 3A 0A 20 20 48 61 73 20 6E 65 76 65 72 20 69 6E 73 74 61 6C 6C 65 64 20 48 61 58 2E 20 57 69 6C 6C 20 76 65 68 65 6D 65 6E 74 6C 79 20 64 65 6E 79 20 61 6E 79 20 73 75 63 68 20 61 63 63 75 73 61 74 69 6F 6E 2E 0A 0A 49 20 41 6D 20 50 75 72 70 6C 65 3A 0A 20 20 4E 65 76 65 72 20 63 68 6F 6F 73 65 73 20 70 75 72 70 6C 65 2E 20 48 69 73 20 66 61 76 6F 75 72 69 74 65 20 70 61 72 74 20 69 73 20 77 61 72 6D 75 70 20 62 65 63 61 75 73 65 20 68 65 20 67 65 74 73 20 74 6F 20 73 68 6F 6F 74 20 61 6C 6C 20 68 69 73 20 74 65 61 6D 6D 61 74 65 73 20 69 6E 20 74 68 65 20 66 61 63 65 2E 0A 0A 6E 75 6B 65 20 74 68 65 20 77 68 61 6C 65 73 3A 0A 20 20 49 6E 76 65 6E 74 73 20 6E 65 77 20 61 6E 64 20 75 74 74 65 72 6C 79 20 69 6E 64 65 63 69 70 68 65 72 61 62 6C 65 20 63 61 6C 6C 6F 75 74 73 20 65 61 63 68 20 6D 61 74 63 68 2E 20 54 68 65 6E 20 67 61 73 6C 69 67 68 74 73 20 68 69 73 20 74 65 61 6D 6D 61 74 65 73 20 69 6E 74 6F 20 66 65 65 6C 69 6E 67 20 73 74 75 70 69 64 20 66 6F 72 20 6E 6F 74 20 6B 6E 6F 77 69 6E 67 20 77 68 61 74 20 74 68 65 20 66 75 63 6B 20 68 65 27 73 20 74 61 6B 69 6E 67 20 61 62 6F 75 74 2E 0A 0A 6A 65 62 65 64 69 61 68 3A 0A 20 20 52 65 73 69 64 65 6E 74 20 61 70 6F 74 68 65 63 61 72 79 2E 20 53 6F 6D 65 74 69 6D 65 73 20 68 69 73 20 72 65 6D 65 64 69 65 73 20 6D 61 6B 65 20 74 68 65 20 74 65 61 6D 20 70 65 72 66 6F 72 6D 20 62 65 74 74 65 72 2E 20 53 6F 6D 65 74 69 6D 65 73 20 77 6F 72 73 65 2E 20 4D 6F 73 74 6C 79 20 77 6F 72 73 65 2E 0A 0A 74 6F 65 6E 69 62 62 6C 65 72 3A 0A 20 20 57 69 6C 6C 20 61 6C 77 61 79 73 20 73 6F 6C 6F 20 72 75 73 68 20 42 20 77 68 65 6E 20 68 65 20 68 61 73 20 74 68 65 20 62 6F 6D 62 2E 20 4B 65 65 70 73 20 67 6F 69 6E 67 20 72 6F 67 75 65 20 74 72 79 69 6E 67 20 74 6F 20 73 6E 65 61 6B 20 75 70 20 62 65 68 69 6E 64 20 74 68 65 20 65 6E 65 6D 79 20 74 65 61 6D 2E 20 42 65 63 61 75 73 65 20 69 74 20 77 6F 72 6B 65 64 20 74 68 61 74 20 6F 6E 65 20 74 69 6D 65 20 31 30 20 79 65 61 72 73 20 61 67 6F 20 61 6E 64 20 68 6F 77 20 63 6F 6F 6C 20 77 61 73 20 74 68 61 74 3F 0A 0A 56 6F 6F 64 6F 6F 20 46 6F 65 74 75 73 3A 0A 20 20 41 67 67 72 65 73 73 69 76 65 6C 79 20 73 68 69 74 20 70 6F 73 74 73 20 6F 6E 20 66 6F 72 75 6D 73 20 64 75 72 69 6E 67 20 63 6F 6D 70 61 6E 79 20 74 69 6D 65 2E 20 41 6C 73 6F 20 6D 61 6E 61 67 65 73 20 74 68 65 20 74 65 61 6D 73 20 70 75 62 6C 69 63 20 69 6D 61 67 65 2C 20 6F 66 74 65 6E 20 74 69 65 64 20 75 70 20 64 6F 69 6E 67 20 64 61 6D 61 67 65 20 63 6F 6E 74 72 6F 6C 20 6F 6E 20 73 6F 63 69 61 6C 20 6D 65 64 69 61 2E 0A 0A 46 6C 61 74 2D 46 61 63 65 3A 0A 20 20 41 6C 77 61 79 73 20 6C 61 74 65 2E 20 42 6C 61 6D 65 73 20 68 69 73 20 62 72 6F 74 68 65 72 2E 20 48 69 73 20 74 77 65 65 74 73 20 74 68 61 74 20 73 74 61 72 74 20 77 69 74 68 20 22 49 27 6D 20 6E 6F 74 20 72 61 63 69 73 74 2C 20 62 75 74 2E 2E 2E 22 20 61 72 65 20 75 73 75 61 6C 6C 79 20 74 68 65 20 72 65 61 73 6F 6E 20 56 6F 6F 64 6F 6F 20 46 6F 65 74 75 73 20 69 73 20 74 69 65 64 20 75 70 20 64 6F 69 6E 67 20 64 61 6D 61 67 65 20 63 6F 6E 74 72 6F 6C 20 6F 6E 20 73 6F 63 69 61 6C 20 6D 65 64 69 61 2E 0A 20 20 22 22 22
  """



{- In a world where the about us page begins with "In a world where" there exists a team. A team so infamous that they have ascended so far past being famous they have now closed the loop, once again becoming completely unknown.

   I bet you're thinking: "Why do they have so many players in their roster?" Because adults have commitments. Like doing a trip to Bunnings to fix the reticulation. Then doing another trip to Bunnings for the bit you forgot. And being dragged around IKEA while trying not to get caught staring at skin coloured gym tights.

   Some say they're past their prime, chasing some nostalgia dragon they will never slay. Others say "Who the fuck are you talking about? Stop following me." All we know is, they're called Convictus.
-}


aboutUsContent : String
aboutUsContent =
    """
20 20 20 20 22 22 22 0A 49 6E 20 61 20 77 6F 72 6C 64 20 77 68 65 72 65 20 74 68 65 20 61 62 6F 75 74 20 75 73 20 70 61 67 65 20 62 65 67 69 6E 73 20 77 69 74 68 20 22 49 6E 20 61 20 77 6F 72 6C 64 20 77 68 65 72 65 22 20 74 68 65 72 65 20 65 78 69 73 74 73 20 61 20 74 65 61 6D 2E 20 41 20 74 65 61 6D 20 73 6F 20 69 6E 66 61 6D 6F 75 73 20 74 68 61 74 20 74 68 65 79 20 68 61 76 65 20 61 73 63 65 6E 64 65 64 20 73 6F 20 66 61 72 20 70 61 73 74 20 62 65 69 6E 67 20 66 61 6D 6F 75 73 20 74 68 65 79 20 68 61 76 65 20 6E 6F 77 20 63 6C 6F 73 65 64 20 74 68 65 20 6C 6F 6F 70 2C 20 6F 6E 63 65 20 61 67 61 69 6E 20 62 65 63 6F 6D 69 6E 67 20 63 6F 6D 70 6C 65 74 65 6C 79 20 75 6E 6B 6E 6F 77 6E 2E 0A 0A 49 20 62 65 74 20 79 6F 75 27 72 65 20 74 68 69 6E 6B 69 6E 67 3A 20 22 57 68 79 20 64 6F 20 74 68 65 79 20 68 61 76 65 20 73 6F 20 6D 61 6E 79 20 70 6C 61 79 65 72 73 20 69 6E 20 74 68 65 69 72 20 72 6F 73 74 65 72 3F 22 20 42 65 63 61 75 73 65 20 61 64 75 6C 74 73 20 68 61 76 65 20 63 6F 6D 6D 69 74 6D 65 6E 74 73 2E 20 4C 69 6B 65 20 64 6F 69 6E 67 20 61 20 74 72 69 70 20 74 6F 20 42 75 6E 6E 69 6E 67 73 20 74 6F 20 66 69 78 20 74 68 65 20 72 65 74 69 63 75 6C 61 74 69 6F 6E 2E 20 54 68 65 6E 20 64 6F 69 6E 67 20 61 6E 6F 74 68 65 72 20 74 72 69 70 20 74 6F 20 42 75 6E 6E 69 6E 67 73 20 66 6F 72 20 74 68 65 20 62 69 74 20 79 6F 75 20 66 6F 72 67 6F 74 2E 20 41 6E 64 20 62 65 69 6E 67 20 64 72 61 67 67 65 64 20 61 72 6F 75 6E 64 20 49 4B 45 41 20 77 68 69 6C 65 20 74 72 79 69 6E 67 20 6E 6F 74 20 74 6F 20 67 65 74 20 63 61 75 67 68 74 20 73 74 61 72 69 6E 67 20 61 74 20 73 6B 69 6E 20 63 6F 6C 6F 75 72 65 64 20 67 79 6D 20 74 69 67 68 74 73 2E 0A 0A 53 6F 6D 65 20 73 61 79 20 74 68 65 79 27 72 65 20 70 61 73 74 20 74 68 65 69 72 20 70 72 69 6D 65 2C 20 63 68 61 73 69 6E 67 20 73 6F 6D 65 20 6E 6F 73 74 61 6C 67 69 61 20 64 72 61 67 6F 6E 20 74 68 65 79 20 77 69 6C 6C 20 6E 65 76 65 72 20 73 6C 61 79 2E 20 4F 74 68 65 72 73 20 73 61 79 20 22 57 68 6F 20 74 68 65 20 66 75 63 6B 20 61 72 65 20 79 6F 75 20 74 61 6C 6B 69 6E 67 20 61 62 6F 75 74 3F 20 53 74 6F 70 20 66 6F 6C 6C 6F 77 69 6E 67 20 6D 65 2E 22 20 41 6C 6C 20 77 65 20 6B 6E 6F 77 20 69 73 2C 20 74 68 65 79 27 72 65 20 63 61 6C 6C 65 64 20 43 6F 6E 76 69 63 74 75 73 2E 0A 20 20 22 22 22
  """
