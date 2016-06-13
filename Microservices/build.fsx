#r "packages/FAKE/tools/FakeLib.dll"
open Fake

RestorePackages()

let buildDir = "./build"

let projects = ["Gateway"; "Greetings"; "GreetingsDb"]

let getProjectFileAndOutputDir proj =
    let outputDir = sprintf "%s/%s/" buildDir proj
    let projectFile = sprintf "./%s/%s.fsproj" proj proj
    (projectFile, outputDir)

let build (projectFile : string, outputDir : string) =
    [projectFile]
    |> MSBuildRelease outputDir "Build"
    |> Log "AppBuld-Output: "


Target "Clean" (fun _ ->
    CleanDir buildDir
)

Target "BuildApp" (fun _ ->
    projects
    |> Seq.map getProjectFileAndOutputDir
    |> Seq.iter build
    trace "Build Complete"
)

"Clean"
  ==> "BuildApp"

RunTargetOrDefault "BuildApp"
