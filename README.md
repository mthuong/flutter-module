# mobile_cross_platform

A new flutter module project.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

## Git hook

Forgot to analyze and your pull request build or linkter failed. Gotcha... Use Git hook.

__lefthook__ will help to run `flutter analyze` every times you push your code to git repo.

- Install `lefthook` on MacOS

```ruby
brew install lefthook
```

- Start hook services for pre-push hook

```ruby
lefthook install
```

### Ignore Git hook

If you want to ignore it, just run git push command with no verify

```ruby
git push --no-verify
```

## Run the Flutter module

- `flutter pub run build_runner build`
- `flutter pub get`
- `pod install` if you have change any flutter package
- Open main XCode project and run as normal
