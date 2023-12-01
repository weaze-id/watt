## 2.1.0

- Make SnackbarUtil.showUnknownErrorSnackbar e parameter optional
- Add notificationMessageData parameter to WattThemeData

  With this parameter you can set default notification message from one place

## 2.0.3

- Now dialog util and snackbar util, need BuildContext parameter

## 2.0.2

- Fix build context has already been initialized

## 2.0.1

- Change min sdk version

## 2.0.0

- Remove http implementation
- Remove witt state management library

## 1.10.0

- Add valueColor property to FilledInput

## 1.9.0

- Remove HttpTransaction stopOnFailure feature

## 1.8.1

- Downgrade intl version to 0.18.0

## 1.8.0

- Change GridBuilder to StaticGrid.builder
- Change SliverInfiniteScroll to InfiniteScroll.sliver
- Add StaticGrid.sliver
- Add InfiniteScroll.separated
- Add InfiniteScroll.sliverSeparated
- Add infinite scroll to StaticGrid.builder and StaticGrid.sliver

## 1.7.2

- Fix GridBuilder not exported

## 1.7.1

- Fix input field icon color not changed

## 1.7.0

- Add valueColor to input field

## 1.6.0

- Make input field cursorColor change highlight and thumb color too

## 1.5.0

- Add focusedBorderColor to input field
- Add enabledBorderColor to input field
- Add labelColor to input field
- Add cursorColor to input field

## 1.4.0

- Add SliverInfiniteScroll

## 1.3.1

- Fix http transaction error handler not working

## 1.3.0

- Change http transaction error handler behavior
- Add hour format

## 1.2.0

- Remove deprecated
- Add grid builder
- Update select list api
- Show image on file input

## 1.1.1

- Fix handle error not awaited

## 1.1.0

- Add custom http error handler

## 1.0.5

- Fix palette data property name typo
- Fix big button with icon not centered

## 1.0.4

- Fix ignoreNotFound fail

## 1.0.3

- Fix httpTransactionLoaderState

## 1.0.2

- Prevent get request show notfound error message

## 1.0.1

- Upgrade witt to 1.1.0

## 1.0.0

- Upgrade witt to 1.0.0
- Update example
- Add brown color
- All color in palette now have foreground property

## 0.6.0

- Add more property to InfiniteScroll

## 0.5.1

- Upgrade witt version

## 0.5.0

- Fix drawer background color
- Fix bottom app bar background color
- Rename ThemeGenerator to WattTheme
- Rename DateUtil to DateFormatUtil
- Rename NumberUtil to NumberFormatUtil
- Change Watt builder property

Before

```dart
return Watt(
  builder: (context, settings) {
    return MaterialApp(
      title: "YOUR APP NAME",
      theme: settings.generate(context),
      darkTheme: settings.generateDark(context),
      home: const HomePage(),
    );
  },
),
```

After

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

## 0.4.0

- Add input border color
- Add input label color
- Add input hint color
- Add input icon color

## 0.3.0

- Add leading property to SelectItem
- Make value property in SelectList nullable

## 0.2.2

- Fix http transaction show http error

## 0.2.1

- Fix http transaction show http error

## 0.2.0

- Add infinite scroll

## 0.1.1

- Use index.dart
- Fix filled input double label

## 0.1.0

initial release
