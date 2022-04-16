port module Main exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (autocomplete, class, id, type_)
import Html.Events exposing (onClick, onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- PORTS


port sendGreetRequest : String -> Cmd msg


port greetReceiver : (String -> msg) -> Sub msg



-- MODEL


type alias Model =
    { userName : String
    , greetedWith : String
    }


init : () -> ( Model, Cmd msg )
init _ =
    ( { userName = ""
      , greetedWith = "Please enter your name below 👇"
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = SetUserName String
    | Submit
    | Recv String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetUserName name ->
            ( { model | userName = name }, Cmd.none )

        Submit ->
            ( model, sendGreetRequest model.userName )

        Recv greetings ->
            ( { model | greetedWith = greetings }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    greetReceiver Recv



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "app", id "app" ]
        [ div [ class "logo" ] []
        , div [ class "result", id "result" ] [ text model.greetedWith ]
        , div [ class "input-box", id "input" ]
            [ input
                [ class "input"
                , id "name"
                , type_ "text"
                , autocomplete False
                , onInput SetUserName
                ]
                []
            , button [ class "btn", onClick Submit ] [ text "Greet" ]
            ]
        ]
