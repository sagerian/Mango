module ConvictUs exposing (main)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font exposing (monospace)
import Html exposing (Html)


main : Html msg
main =
    Element.layout
        [ Background.color palette.greyBlack
        , Font.color palette.greyWhite
        , Font.family [ monospace ]
        , Font.size 37
        , padding 30
        , centerX
        , centerY
        , width fill
        , height fill
        ]
    <|
        column [ width fill ] [ topbar, middle, footer ]


topbar : Element msg
topbar =
    el
        [ centerX
        , centerY
        , height fill
        , Border.widthEach
            { top = 0
            , bottom = 1
            , left = 0
            , right = 0
            }
        , width fill
        , padding 17
        ]
        (text "ConvictUs | we're so good it's criminal")


middle : Element msg
middle =
    row
        [ width fill
        , height fill
        ]
        [ sidebar, body ]


sidebar : Element msg
sidebar =
    column
        [ Border.widthEach
            { top = 0
            , bottom = 1
            , left = 0
            , right = 0
            }
        , width <| px 222
        , padding 17
        , height fill
        , spacing 17
        ]
        [ text "roster", text "about us" ]


body : Element msg
body =
    column
        [ Border.widthEach
            { top = 0
            , bottom = 1
            , left = 1
            , right = 0
            }
        , padding 17
        , spacing 77
        , width fill
        , Font.size 27
        ]
        [ lobes, scubasteve, nukeTheWhales, iAmPurple, jebediah ]


lobes : Element msg
lobes =
    column
        [ width fill ]
        [ el
            [ Font.color <| palette.green
            , padding 7
            ]
            (text "lobes:")
        , paragraph
            [ Font.color <| palette.white ]
            [ text "Frequently spotted at LANs failing to get on the network. Always the last to join the lobby. Blames gremlins." ]
        ]


scubasteve : Element msg
scubasteve =
    column
        [ width fill ]
        [ el
            [ Font.color <| palette.green
            , padding 7
            ]
            (text "scubasteve:")
        , paragraph
            [ Font.color <| palette.white ]
            [ text "Has never installed HaX. Will vehemently deny any such allegations." ]
        ]


nukeTheWhales : Element msg
nukeTheWhales =
    column
        [ width fill ]
        [ el
            [ Font.color <| palette.green
            , padding 7
            ]
            (text "nuke the whales:")
        , paragraph
            [ Font.color <| palette.white ]
            [ text "Invents call-outs on the fly:" ]
        ]


iAmPurple : Element msg
iAmPurple =
    column
        [ width fill ]
        [ el
            [ Font.color <| palette.green
            , padding 7
            ]
            (text "i am purple:")
        , paragraph
            [ Font.color <| palette.white ]
            [ text "Never chooses purple. Startles easily. Sprays wildly." ]
        ]


jebediah : Element msg
jebediah =
    column
        [ width fill ]
        [ el
            [ Font.color <| palette.green
            , padding 7
            ]
            (text "jebediah:")
        , paragraph
            [ Font.color <| palette.white ]
            [ text "Not a diversity hire. Don't be racist." ]
        ]


footer : Element msg
footer =
    none


palette :
    { black : Color
    , greyBlack : Color
    , red : Color
    , redBright : Color
    , green : Color
    , greenBright : Color
    , yellow : Color
    , yellowBright : Color
    , blue : Color
    , blueBright : Color
    , magenta : Color
    , magentaBright : Color
    , cyan : Color
    , cyanBright : Color
    , white : Color
    , greyWhite : Color
    }
palette =
    { black = rgb255 0x16 0x16 0x16
    , greyBlack = rgb255 0x39 0x39 0x39
    , red = rgb255 0xDA 0x22 0x22
    , redBright = rgb255 0xE6 0x79 0x32
    , green = rgb255 0x77 0xB7 0x7D
    , greenBright = rgb255 0x8C 0xBC 0x68
    , yellow = rgb255 0xD1 0xB5 0x41
    , yellowBright = rgb255 0xE4 0x9C 0x39
    , blue = rgb255 0x60 0x59 0xA9
    , blueBright = rgb255 0x4E 0x79 0xC5
    , magenta = rgb255 0x8C 0x4E 0x99
    , magentaBright = rgb255 0xA7 0x78 0xB4
    , cyan = rgb255 0x59 0xA5 0xA9
    , cyanBright = rgb255 0x69 0xB1 0x90
    , white = rgb255 0xF4 0xF4 0xF4
    , greyWhite = rgb255 0xA8 0xA8 0xA8
    }
