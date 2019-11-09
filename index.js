import React, { Component } from 'react';
import ReactNative, { NativeModules, UIManager } from 'react-native';

import RNWeekdayPicker from './picker';

const Picker = NativeModules.RNWeekdayPicker;

class WeekDatePickerComponent extends Component {
  constructor(props) {
    super(props);
    this.weekdayPickerRef = React.createRef();
  }

  componentDidMount() {
    UIManager.dispatchViewManagerCommand(
      ReactNative.findNodeHandle(this),
      UIManager.getViewManagerConfig('RNWeekdayPicker').Commands.setupMinDate,
      [
        this.props.minimumDate.getTime(),
        this.props.maximumDate.getTime(),
        this.props.date.getTime(),
      ],
    );
  }
  render() {
    return (
      <RNWeekdayPicker
        ref={this.weekdayPickerRef}
        style={this.props.style}
        onChange={selectedDate => {
          this.props.onDateChange(new Date(selectedDate.nativeEvent.timestamp));
        }}
      />
    );
  }
}
export default WeekDatePickerComponent;
