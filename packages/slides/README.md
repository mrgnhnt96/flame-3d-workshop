# slides


An interactive slide deck for the Flame 3D Workshop.


## Setup


Clone this monorepo to get started, or use `ignite` to generate your own Flame 3D project.

In order to run, you will need to follow
[the pre-requisites for setting up flame_3d](https://github.com/flame-engine/flame/tree/main/packages/flame_3d#prerequisites)
; notably:

- Run it on macOS;

- Enable Impeller by adding the following key to `/macos/Runner/Info.plist`:

```xml
<dict>
    ...
 <key>FLTEnableImpeller</key>
 <true/>
</dict>
```

- And then run with:

```bash
flutter run -d macos --enable-flutter-gpu
```
