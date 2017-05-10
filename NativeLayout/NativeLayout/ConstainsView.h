

#import <UIKit/UIKit.h>


extern CGFloat const kConstainsViewHeight;
extern CGFloat const kImageBottomPadding;
extern CGFloat const kAvatorSize;
extern CGFloat const kLeftRightPadding;
#define IOS9_OR_GREATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

@interface ConstainsView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@end
