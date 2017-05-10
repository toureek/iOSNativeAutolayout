
#import "AnchorViewController.h"
#import "AnchorView.h"


@interface AnchorViewController ()

@property (nonatomic, strong) AnchorView *anchorView;

@end

@implementation AnchorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AnchorView";
    [self initAndSetupAnchorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initAndSetupAnchorView {
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, kConstainsViewHeight);
    _anchorView = [[AnchorView alloc] initWithFrame:frame];
    [self.view addSubview:_anchorView];
}

@end
