import Js
import Js.Object
import Js.DOM
import Js.DOM.Document
import Js.React
import Js.React.DOM

%default total



hello : String -> JS_IO Js.React.Element
hello = simple (cast . js "{who: %0}" (String -> JS_IO Ptr))
               (js "%0.who" (Ptr -> JS_IO String) . cast)
               (\who => div !(cast $ js "{style: {color: 'blue'}}" (JS_IO Ptr))
                            [Text $ "Hello, " ++ who ++ "!"])

main : JS_IO ()
main = render !(getElement "root")
              !(div !empty
                    [ ChildElement !(hello "Idris")
                    , ChildElement !(hello "Electron")
                    , ChildElement !(hello "React")
                    , Text "... it's working :)"
                    ])
