/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNWeekdayPicker.h"
#import <React/RCTBridge.h>
#import <React/UIView+React.h>
#import <WeekdayDatePicker/BoSWeekdayDatePickerSelectedItems.h>

@interface RNWeekdayPicker ()

@property (nonatomic, copy) RCTBubblingEventBlock onChange;

@end

@implementation RNWeekdayPicker

- (instancetype)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
      RNWeekdayPicker __weak *weakSelf = self;
      [self setDidSelectRowCallback:^(BoSWeekdayDatePickerSelectedItems *selectedItems) {
          if (weakSelf.onChange) {
              weakSelf.onChange(@{
                   @"timestamp": @(selectedItems.selectedDate.timeIntervalSince1970 * 1000.0)
                   });
          }
      }];
  }
  return self;
}
@end

