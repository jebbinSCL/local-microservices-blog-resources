open Suave
open Suave.Http

[<EntryPoint>]
let main _ = 
    let config = { defaultConfig with bindings = [ HttpBinding.mkSimple HTTP "0.0.0.0" 8080 ] }
    startWebServer config (Successful.OK "Hello World from Database!")
    0
