# OCWaveView
🌊 A UIView subclass to present visual feedback for audio input

There are currently three different types of waveViews you can choose from: `WaveView`, `SimpleWaveView` and `BarsWaveView`.

| <img src=https://github.com/emannuelOC/OCWaveView/blob/master/images/siri_wave_quiet.png width="300"> | <img src=https://github.com/emannuelOC/OCWaveView/blob/master/images/siri_wave.png width="300"> | <img src=https://github.com/emannuelOC/OCWaveView/blob/master/images/siri_wave_loud.png width="300"> |

| <img src=https://github.com/emannuelOC/OCWaveView/blob/master/images/simple_wave.png width="300"> | <img src=https://github.com/emannuelOC/OCWaveView/blob/master/images/bars_wave.png width="300"> |

- [Requirements](#requirements)
- [Usage](#usage)
- [Installation](#installation)
- [Acknowledgments](acknowledgments)
- [License](#license)

## Requirements

* iOS 8.0+
* Xcode 8.0+

## Usage

### Code

Create one of the Wave View (Wave, SimpleWave of Bars) and add it as a subview anywhere, customize it changing the colors and update it setting its `value` property based on the audio input.

### Storyboard

Drag a view into your scene and set its Class to be `WaveView` and the Module to `OCWaveView`. Then you can inspect the colors for each wave and the initial value.

Create an outlet and change its `value` property according to the audio input to update the waves.


## Instalation

### Manually

You can simply copy `OCWaveView.swift` into your project.

### Cocoapods

[Cocoapods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

In order to integrate OCWaveView into your project, add it to your Podfile:

```ruby
pod 'OCWaveView'
```

Then, run the following command:

```bash
$ pod install
```

## Acknowledgements

A big thanks to:

* [Kaique D'amato](https://github.com/KaiqueDamato/) for helping me distribute OCWaveView via Cocoapods and for yelling at me that "finished is better than perfect" 
* [Rafael Feroli](https://twitter.com/rafaelferoli) for helping me out with how the waves should look

## License

OCWaveView is released under the MIT license. See [LICENSE](https://github.com/emannuelOC/OCWaveView/blob/master/LICENSE) for details.
