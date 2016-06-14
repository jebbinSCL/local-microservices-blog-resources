module Config

open System
open System.Configuration 

let getConfigValue (key : string) = 
    let value = ConfigurationManager.AppSettings.Item(key)
    if String.IsNullOrWhiteSpace value then
        failwith <| sprintf "Configuration value with key %s is missing / is null  / is blank in configuration. Add key and value to proceed." key
    else 
        value

let getUriConfig (key : string) = 
    let value = getConfigValue key
    let errorMessage = sprintf "%s config is invalid. Make sure a valid Uri value has been entered." key
    try
        Uri(value)
    with
    | :? UriFormatException as ex -> 
        let fullMessage = errorMessage + " " + ex.Message
        raise <| Exception(fullMessage,ex)
    | ex -> 
        let fullMessage = errorMessage + " " + ex.Message
        raise <| Exception(fullMessage,ex)

let getIntConfig (key : string) =
    match Int32.TryParse <| getConfigValue key with
    | true , value -> value
    | _ -> 
        let message = sprintf "Could not parse configuration value for key: %s as int" key
        failwith message