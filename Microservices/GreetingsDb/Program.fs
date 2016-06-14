open Suave
open Suave.Http
open Config

let serviceIp = getConfigValue "ServiceIp"
let servicePort = getIntConfig "ServicePort"

[<EntryPoint>]
let main _ = 
    let config = { defaultConfig with bindings = [ HttpBinding.mkSimple HTTP serviceIp servicePort ] }
    startWebServer config (Successful.OK "Hello World from Database!\n")
    0
