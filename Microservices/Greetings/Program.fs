open Suave
open Suave.Filters
open Suave.Operators
open Suave.Successful
open System
open System.Net
open System.Net.Http

[<EntryPoint>]
let main _ = 
    let dbUrl = "http://greetings-db:8080"
    let getDbResponse () = 
        use client = new HttpClient()

        let result = client.GetAsync(dbUrl).Result
        match result.StatusCode with 
        | HttpStatusCode.OK -> 
            let data = result.Content.ReadAsStringAsync().Result
            let output = sprintf "Received Message From Database: %s at %A\n" data DateTime.Now
            output
        | _ -> failwith <| sprintf "Db Request failed with status code: %A; Reason: %A\n" result.StatusCode result.ReasonPhrase

    let handler =  request (fun r -> OK (getDbResponse()))
    let app : WebPart = 
        choose 
            [ GET >=> choose [ path "/" >=> handler]]

    let config = { defaultConfig with bindings = [ HttpBinding.mkSimple HTTP "0.0.0.0" 8080 ] }
    startWebServer config app
    0
