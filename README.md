# watt

## Installation

### Setup font

Watt uses poppins font family as default font family

- Download the [font](https://fonts.google.com/share?selection.family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500)
- Import font to pubspec.yaml

```yaml
fonts:
  - family: Poppins
    fonts:
      - asset: fonts/Poppins/Poppins-Thin.ttf
      - asset: fonts/Poppins/Poppins-ThinItalic.ttf
        weight: 100
      - asset: fonts/Poppins/Poppins-Light.ttf
      - asset: fonts/Poppins/Poppins-LightItalic.ttf
        weight: 300
      - asset: fonts/Poppins/Poppins-Regular.ttf
      - asset: fonts/Poppins/Poppins-Italic.ttf
        weight: 400
      - asset: fonts/Poppins/Poppins-Medium.ttf
      - asset: fonts/Poppins/Poppins-MediumItalic.ttf
        weight: 500
      - asset: fonts/Poppins/Poppins-Bold.ttf
      - asset: fonts/Poppins/Poppins-BoldItalic.ttf
        weight: 700
      - asset: fonts/Poppins/Poppins-Black.ttf
      - asset: fonts/Poppins/Poppins-BlackItalic.ttf
        weight: 900
```

### Install Watt

- Follow instalation instruction [here](https://pub.dev/packages/watt/install)

- Initialize Watt

```dart
return Watt(
  builder: (context, theme, darkTheme) {
    return MaterialApp(
      title: "YOUR APP NAME",
      theme: theme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  },
),
```

## Features

- Http client & http transaction
- Responsive
- Color palette
- Reusable widgets

## Widgets

- Buttons
    - BigButton
    - OutlinedBigButton
    - TextBigButton
- Infinite scroll
- Inputs
    - FileInput
    - FilledInput
    - UnderlinedInput
    - OutlinedInput
- Loader
    - LoaderNotifier
    - Loader
- Message
    - ErrorMessage
    - NoDataMessage
    - NoInternetMessage
    - UnknownErrorMessage
- Select
    - SelectList
    - MultiSelectList
- StaticGrid
- Utilities
    - ColorUtil
    - DateFormatUtil
    - DialogUtil
    - NumberFormatUtil
    - SnackbarUtil

## Additional Information
This library is currently on experimental status and not ready for production. The API may change slightly when more features are added, and some use-cases may not be as simple as they could be.

## Contributing

Contributions are welcomed!

Here is a curated list of how you can help:

- Report bugs and scenarios that are difficult to implement
- Report parts of the documentation that are unclear
- Update the documentation / add examples
- Implement new features by making a pull-request
