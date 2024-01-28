module Main exposing (main)

import Browser exposing (Document, document)
import Html exposing (Html, div, pre, span, text)
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
      , content = homeContent
      , activeTab = Home
      , activeTabBackground = palette.green
      , activeTabFontColour = palette.grey80
      , inactiveTabBackground = palette.grey80
      , inactiveTabFontColour = palette.green
      }
    , Cmd.none
    )



-- MODEL :: state of the application


type alias Model =
    { player : String
    , score : Int
    , content : List TextFragment
    , activeTab : Tabs
    , activeTabBackground : String
    , activeTabFontColour : String
    , inactiveTabBackground : String
    , inactiveTabFontColour : String
    }


type Msg
    = ClickedHome
    | ClickedKrew
    | ClickedAboutUs


type Tabs
    = Home
    | Krew
    | AboutUs


type TextFragment
    = Regular String
    | Bold String
    | Italic String
    | BoldItalic String
    | Centered String


renderFragment : TextFragment -> Html Msg
renderFragment frag =
    case frag of
        Regular string ->
            text string

        Bold string ->
            span [ style "font-weight" "bold" ] [ text string ]

        Italic string ->
            span [ style "font-style" "italic" ] [ text string ]

        BoldItalic string ->
            span [ style "font-weight" "bold", style "font-style" "italic" ] [ text string ]

        Centered string ->
            div [ style "text-align" "center" ] [ text string ]


view : Model -> Document Msg
view model =
    { title = "Convictus"
    , body =
        [ div
            [ style "display" "flex"
            , style "flex-direction" "column"
            , style "height" "100vh"
            , style "width" "100vw"
            , style "font-family" "ComicCodeLigatures"
            ]
            [ header model
            , content model
            , footer
            ]
        ]
    }


header : Model -> Html Msg
header model =
    div
        [ style "flex" "0 1 auto" ]
        [ div
            [ style "display" "flex"
            , style "justify-content" "space-between"
            , style "align-items" "center"
            , style "font-size" "47px"
            , style "background-color" palette.grey80
            , style "border-bottom" ("3px solid" ++ palette.grey100)
            , style "font-weight" "bold"
            ]
            [ div
                [ onClick ClickedHome
                , style "cursor" "pointer"
                , style "padding" "0px 17px 0px 17px"
                , style "margin" "17px"
                , style "border-radius" "17px"
                , style "border" ("1px solid" ++ palette.grey10)
                , style "background-color"
                    (if model.activeTab == Home then
                        model.activeTabBackground

                     else
                        model.inactiveTabBackground
                    )
                , style "color"
                    (if model.activeTab == Home then
                        model.activeTabFontColour

                     else
                        model.inactiveTabFontColour
                    )
                ]
                [ text "Convictus" ]
            , div
                [ onClick ClickedKrew
                , style "cursor" "pointer"
                , style "padding" "0px 17px 0px 17px"
                , style "margin" "17px"
                , style "border-radius" "17px"
                , style "border" ("1px solid" ++ palette.grey10)
                , style "background-color"
                    (if model.activeTab == Krew then
                        model.activeTabBackground

                     else
                        model.inactiveTabBackground
                    )
                , style "color"
                    (if model.activeTab == Krew then
                        model.activeTabFontColour

                     else
                        model.inactiveTabFontColour
                    )
                ]
                [ text "the Krew" ]
            , div
                [ onClick ClickedAboutUs
                , style "cursor" "pointer"
                , style "padding" "0px 17px 0px 17px"
                , style "margin" "17px"
                , style "border-radius" "17px"
                , style "border" ("1px solid" ++ palette.grey10)
                , style "background-color"
                    (if model.activeTab == AboutUs then
                        model.activeTabBackground

                     else
                        model.inactiveTabBackground
                    )
                , style "color"
                    (if model.activeTab == AboutUs then
                        model.activeTabFontColour

                     else
                        model.inactiveTabFontColour
                    )
                ]
                [ text "about us" ]
            ]
        ]


content : Model -> Html Msg
content model =
    div
        [ style "flex" "1 1 auto"
        , style "overflow-y" "auto"
        , style "background-color" palette.grey70
        ]
        [ pre
            [ style "display" "flex"
            , style "white-space" "pre-wrap"
            , style "justify-content" "center"
            , style "align-items" "center"
            , style "flex-flow" "column"
            , style "font-family" "ComicCodeLigatures"
            ]
            [ div
                [ style "background-color" palette.grey70
                , style "color" palette.grey20
                , style "width" "90%"
                , style "max-width" "600px"
                , style "overflow-y" "auto"
                , style "padding" "10px"
                , style "line-height" "1.6"
                , style "font-size" "23px"
                , style "align-items" "center"
                , style "text-allign" "center"
                , style "display" "flex"
                , style "flex-flow" "column"
                ]
                (List.map renderFragment model.content)
            ]
        ]


footer : Html Msg
footer =
    div
        [ style "flex" "0 1 auto"
        ]
        [ div
            [ style "display" "flex"
            , style "background-color" palette.grey80
            , style "justify-content" "center"
            , style "align-items" "center"
            , style "border-top" ("3px solid" ++ palette.grey100)
            , style "font-style" "italic"
            ]
            [ div
                [ style "display" "flex"
                , style "flex-flow" "column"
                , style "margin" "7px"
                , style "font-size" "37px"
                , style "align-items" "center"
                , style "font-family" "ComicCodeLigatures"
                , style "color" palette.grey10
                ]
                [ text
                    "\"we're so good it's criminal\""
                , span
                    [ style "font-size" "7px"
                    ]
                    [ text "© Lobasaurus Industries - now to ∞... and beyond" ]
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedHome ->
            ( { model | content = homeContent, activeTab = Home }, Cmd.none )

        ClickedKrew ->
            ( { model | content = krewContent, activeTab = Krew }, Cmd.none )

        ClickedAboutUs ->
            ( { model | content = aboutUsContent, activeTab = AboutUs }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    none



-- CONTENT


homeContent : List TextFragment
homeContent =
    [ Regular "DO\nYOU\nWANT\nTO\nPLAY\nA\n", BoldItalic "GAME", Regular "...?" ]


krewContent : List TextFragment
krewContent =
    [ Bold "lobes:\n"
    , Regular "  Frequently spotted at LANs swearing at his PC, wondering why the fuck it doesn't show up on the network. Maintains the Convictus servers and databases.\n\n"
    , Bold "scubasteve:\n"
    , Regular "  Has never installed HaX. Will vehemently deny any such accusation.\n\n"
    , Bold "I Am Purple:\n"
    , Regular "  Never chooses purple. His favourite part is warmup because he gets to shoot all his teammates in the face.\n\n"
    , Bold "nuke the whales:\n"
    , Regular "  Invents new and utterly indecipherable callouts each match. Then gaslights his teammates into feeling stupid for not knowing what the fuck he's taking about.\n\n"
    , Bold "jebediah:\n"
    , Regular "  Resident apothecary. Sometimes his remedies make the team perform better. Sometimes worse. Mostly worse.\n\n"
    , Bold "toenibbler:\n"
    , Regular "  Will always solo rush B when he has the bomb. Keeps going rogue trying to sneak up behind the enemy team. Because it worked that one time 10 years ago and how cool was that?\n\n"
    , Bold "Voodoo Foetus:\n"
    , Regular "  Aggressively shit posts on forums during company time. Also manages the teams public image, often tied up doing damage control on social media.\n\n"
    , Bold "Flat-Face:\n"
    , Regular "  Always late. Blames his brother. His tweets that start with \"I'm not racist, but...\" are usually the reason Voodoo Foetus is tied up doing damage control on social media.\n\n"
    , Bold "vaj:\n"
    , Regular "  When he finally left Kalgoorlie and got access to the internet he became addicted to two things: online gaming and pornography. Always complaining that Convictus is getting in the way of him focussing on his true passion."
    ]


aboutUsContent : List TextFragment
aboutUsContent =
    [ Regular "  In a world where the about us page begins with\n\n", Centered "\"In a world where\"\n\n", Regular "  there exists a team. A team so infamous that they have ascended so far past being famous they have now closed the loop, once again becoming completely unknown.\n\n  I bet you're thinking: \"Why do they have so many players in their roster?\" Because adults have commitments. Like a trip to Bunnings to fix the reticulation. Then doing another trip to Bunnings for the bit you forgot. And being dragged around IKEA while trying not to get caught staring at skin coloured gym tights.\n\n  Some say they're past their prime, chasing down a nostalgia dragon they will never slay.\n  Others say \"Who the fuck are you talking about? Stop following me.\"\n\nAll we know is, ", Bold "they're called Convictus." ]


type alias Palette =
    { black : String
    , grey100 : String
    , grey90 : String
    , grey80 : String
    , grey70 : String
    , grey60 : String
    , grey50 : String
    , grey40 : String
    , grey30 : String
    , grey20 : String
    , grey10 : String
    , white : String
    , red : String
    , green : String
    , yellow : String
    , blue : String
    , magenta : String
    , cyan : String
    }


palette : Palette
palette =
    { black = "#000000"
    , grey100 = "#171414"
    , grey90 = "#272525"
    , grey80 = "#3c3838"
    , grey70 = "#565151"
    , grey60 = "#726e6e"
    , grey50 = "#8f8b8b"
    , grey40 = "#ada8a8"
    , grey30 = "#cac5c4"
    , grey20 = "#e5e0df"
    , grey10 = "#f7f3f2"
    , white = "#ffffff"
    , red = "#DC050C"
    , green = "#4EB265"
    , yellow = "#F7F056"
    , blue = "#437DBF"
    , magenta = "#994F88"
    , cyan = "#7BAFDE"
    }
