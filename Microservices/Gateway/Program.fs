open Suave
open Suave.Filters
open Suave.Operators
open Suave.Successful
open System
open System.Net
open System.Net.Http

[<EntryPoint>]
let main _ = 
    let greetingsServiceUrl = "http://greetings-service:8080"
    let getDbResponse () = 
        use client = new HttpClient()

        let result = client.GetAsync(greetingsServiceUrl).Result
        match result.StatusCode with 
        | HttpStatusCode.OK -> 
            let data = result.Content.ReadAsStringAsync().Result
            let output = sprintf "Request for stored greeting at %A. \nStored Greeting: %s" DateTime.Now data
            output
        | _ -> failwith <| sprintf "Db Request failed with status code: %A; Reason: %A" result.StatusCode result.ReasonPhrase

    let handler =  request (fun r -> OK (getDbResponse()))
    let app : WebPart = 
        choose 
            [ GET >=> choose [ path "/" >=> handler]]

    let config = { defaultConfig with bindings = [ HttpBinding.mkSimple HTTP "0.0.0.0" 8080 ] }
    startWebServer config app
    0
