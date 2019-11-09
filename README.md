
# Summary
This is React Native modules to wrap iOS (only) Weekday date picker
https://github.com/bagofstars/WeekdayDatePicker

<img width="374" alt="Screen Shot 2019-11-09 at 13 50 39" src="https://user-images.githubusercontent.com/1519521/68524325-30acd700-02f8-11ea-8db6-e2bf3610ba06.png">

# Installation

## Using npm:

```npm install --save react-native-weekday-date-picker```

## or using yarn:

```yarn add react-native-weekday-date-picker```

## If you are using RN < 0.60.0

### Automatically linking
```react-native link react-native-weekday-date-picker```


### Manual linking
#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-weekday-date-picker` and add `WeekdayPicker.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libWeekdayPicker.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

# Usage

```javascript
import DatePicker from 'react-native-weekday-date-picker';

<DatePicker
  style={{ flex: 1 }}
  date={dateValue}
  minimumDate={minDate}
  maximumDate={maxDate}
  onDateChange={selectedDate => {
    setDateValue(selectedDate);
  }}
/>;


```
