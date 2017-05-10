
#import "ConstainsViewController.h"
#import "ConstainsView.h"


@interface ConstainsViewController ()

@property (nonatomic, strong) ConstainsView *constainsView;


@end

@implementation ConstainsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"constainsView";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initAndSetupConstainsView];
}

- (void)initAndSetupConstainsView {
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, kConstainsViewHeight);
    _constainsView = [[ConstainsView alloc] initWithFrame:frame];
    [self.view addSubview:_constainsView];
}



@end
