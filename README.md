# README

## About

Create GUI apps with Wails + Elm!

## Dev env requirements

- setup a [golang toolchain](https://go.dev/doc/install)
- setup a [wails toolchain](https://wails.io/docs/next/gettingstarted/installation)
- install [elm-live](https://www.elm-live.com/) globally: `npm install -g elm-live`

## Create a project

Run the following command:

```
wails init -n wails-hello-world -t https://github.com/benjamin-thomas/wails-elm-template
```

## Live Development

Inside the project folder, run: `wails dev`. This setup provides auto-reloading of backend+frontend code.

It's also possible to keep the frontend reloading process separated by:

- deleting the `frontend:dev:watcher` entry in `./wails.json`
- then run `cd ./frontend && npm run dev:watch` in a separate terminal (this triggers the elm-live toolchain)

## Debugging

It's possible to debug and inspect javascript code at: http://localhost:34115.

This URL also allows the inspection of state change provided by elm's '--debug' compile flag.

## Building

To build a production binary, use `wails build`.

## Note on performance/alternatives

I feel this stack could be a great combo for GUI programming. Elm's promise to eliminate runtime errors could turn out to be invaluable.

I evaluated other technologies, here's my list pros and cons while trying to build a hello world app on an old computer:

```
| Technology               | Pros                                                                                            | Cons                                                                                                         |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| JavaFX (with modules)    | Easy cross platform development                                                                 | Hard cross platform distribution (tooling is still a little rough)                                           |
|                          |                                                                                                 | Packaged app remains rather large (~30-90MB)                                                                 |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| JavaFX (without modules) | Easier distribution if using Bellsoft/Liberica JDK                                              | What are the security implications for the end user?                                                         |
|                          |                                                                                                 | The distributed package is even larger (~150MB)                                                              |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| JavaFX                   | Interesting ecosystem for building business apps (see: ControlsFX,etc.)                         | Slow app startup (2s)                                                                                        |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| JavaFX                   | Potentially tiny binaries if distributes as .jar                                                | The end user needs an SDK, that's a pretty heavy requirement (+ becomes a security concern to manage)        |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| JavaFX                   | Can achieve a rather native look.                                                               | Task manager reports a javaw.exe binary, not my-app.exe.                                                     |
|                          |                                                                                                 | I could not find how to circumvent this although I'm pretty sure it's doable                                 |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Electron                 | Easy dev setup, easy distribution with extra packages                                           | Distributed package remains quite large (~70-120MB)                                                          |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Electron                 | I saw a small memory footprint in my simple test (has there been improvements here?)            | Memory usage is said to be a problem, memory leaks could easy to introduce and hard to find/debug            |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Electron                 | Very slow app startup (4s)                                                                      | Microsoft documented the high memory usage of Microsoft Teams for their users (ouch!).                       |
|                          |                                                                                                 | Then announced moving off Electron for this reason.                                                          |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Flutter (Dart)           | Cross-device development (mobile+desktop) by Google. Fast startup and dev hot-reload (< 1s).    | Apps look pretty tied up to Google's material design. Some community projects like `fluent_ui` try           |
|                          | Binary bundle could downsized if zipped from ~20MB                                              | to address this but are still at an early stage.                                                             |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| .Net MAUI (C#, F#, VB)           | Multi-platform App UI by Microsoft: almost cross-platform (cross-device) dev.                   | No Linux support :(                                                                                          |
|                          |                                                                                                 | Seems to require a Windows dev machine (no dotnet core support)                                              |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Avalonia (C#, F#, VB)            | Community driven cross-device development                                                       | Binary size remains fairly large. Incorporates DLLs that got wrongly tagged as viruses by AV companies, etc. |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Tauri (Rust based)       | Very similar to Wails.                                                                          | Rust compile times make hot-reload so slow (30-40s!)                                                         |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Wails + Elm              | Fast startup (1s), very fast auto-reload (instant), small binary (4MB), small memory footprint. | v2 of the project is a little early, but the project has been around for many years.                         |
|                          | The architecture and final output feel much simpler than the other solutions.                   |                                                                                                              |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
```

If you feel I got things wrong, or want to add to this list, don't hesitate to open a PR!

## Improve this template

Go one level above this project. Then run these two commands and ensure hot-reload works.

```bash
rm -r ./wails-elm-test;wails init -n wails-elm-test -t ./wails-elm-template/
cd ./wails-elm-test/ && code . && wails dev
```
