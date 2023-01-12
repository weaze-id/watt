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
