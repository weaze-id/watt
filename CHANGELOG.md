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
