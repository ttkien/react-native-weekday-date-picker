#import "RNWeekdayPickerManager.h"
#import "BoSWeekdayDatePicker.h"
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import <React/UIView+React.h>
#import <React/RCTUIManager.h>
#import "RNWeekdayPicker.h"


@interface RNWeekdayPickerManager ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation RNWeekdayPickerManager
static NSString *const BoSWeekdayDatePickerExampleDateFormatString = @"EEEE dd MMMM yyyy";


RCT_EXPORT_MODULE(RNWeekdayPicker)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

- (BoSWeekdayDatePickerView *)view
{
    [self setupDateFormatter];
    
    
    return [self setupWeekdayDatePicker];
}

RCT_EXPORT_METHOD(setupMinDate:(nonnull NSNumber *)viewTag minDate:(nonnull NSNumber *)minDateNumber maxDate:(nonnull NSNumber *)maxDateNumber initialSelectionDate:(nonnull NSNumber *)initialSelectionDateNumber)
{
    
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        BoSWeekdayDatePickerView *view = viewRegistry[viewTag];
        
        if (!view || ![view isKindOfClass:[BoSWeekdayDatePickerView class]]) {
            return;
        }
        
        float INTERVAL_PE_YEAR = 60 * 60 * 24 * 365.25;
        NSDate *minDate;
        if (minDateNumber) {
            minDate = [NSDate dateWithTimeIntervalSince1970:(minDateNumber.longLongValue / 1000) - INTERVAL_PE_YEAR * 5];
        }
        
        NSDate *maxDate;
        if (maxDateNumber) {
            maxDate = [NSDate dateWithTimeIntervalSince1970:(maxDateNumber.longLongValue / 1000) + INTERVAL_PE_YEAR * 5] ;
        }
        
        NSDate *initialSelectionDate;
        if (initialSelectionDateNumber) {
            initialSelectionDate = [NSDate dateWithTimeIntervalSince1970:initialSelectionDateNumber.longLongValue / 1000];
        } else {
            initialSelectionDate = [NSDate date];
        }
        
        NSDate *now = [NSDate date];
        NSDate *sevenDaysAgo = [now dateByAddingTimeInterval:-7*24*60*60];
        NSDate *maxium = [now dateByAddingTimeInterval:365*7*24*60*60];
        
        [view setupMinDate:minDate maxDate:maxDate initialSelectionDate:initialSelectionDate];
        
    }];
}

- (void)setupDateFormatter
{
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateFormat = BoSWeekdayDatePickerExampleDateFormatString;
}

- (RNWeekdayPicker *)setupWeekdayDatePicker
{
    RNWeekdayPicker *sourceCodePickerView = [[RNWeekdayPicker alloc] initWithFrame:self.datePickerFrame];
    
    return sourceCodePickerView;
}

- (CGRect)datePickerFrame
{
    return CGRectMake(0.0, 336.0f, CGRectGetWidth([UIScreen mainScreen].bounds), 216.0f);
}

@end
