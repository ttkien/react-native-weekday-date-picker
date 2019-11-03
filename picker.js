/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @format
 * @flow
 */
('use strict');

import { requireNativeComponent } from 'react-native';

import type { SyntheticEvent } from 'react-native';
import type { ViewProps } from 'react-native';
import type { NativeComponent } from 'react-native';

type Event = SyntheticEvent<
  $ReadOnly<{|
    timestamp: number,
  |}>,
>;

type NativeProps = $ReadOnly<{|
  ...ViewProps,
|}>;
type RCTDatePickerNativeType = Class<NativeComponent<NativeProps>>;

export default ((requireNativeComponent(
  'RNWeekdayPicker',
): any): RCTDatePickerNativeType);
