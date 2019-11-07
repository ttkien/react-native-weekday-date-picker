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

RCT_EXPORT_METHOD(setupMinDate:(nonnull NSNumber *)viewTag minDate:(NSString *)minDate maxDate:(NSString *)maxDate initialSelectionDate:(NSString *)initialSelectionDate)
{
    RCTLogInfo(@"setupMinDate: %@, maxDate: %@, initialSelectionDate: %@", minDate, maxDate, initialSelectionDate);
    
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        BoSWeekdayDatePickerView *view = viewRegistry[viewTag];
        
        if (!view || ![view isKindOfClass:[BoSWeekdayDatePickerView class]]) {
            return;
        }
        
        NSDate *now = [NSDate date];
        NSDate *sevenDaysAgo = [now dateByAddingTimeInterval:-7*24*60*60];
        NSDate *maxium = [now dateByAddingTimeInterval:365*7*24*60*60];
        
        [view setupMinDate:sevenDaysAgo maxDate:maxium initialSelectionDate:now];
        
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
