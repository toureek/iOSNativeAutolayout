

#import "ViewController.h"
#import "ConstainsViewController.h"
#import "AnchorViewController.h"

NSString *const kViewControllerCell = @"cell";
NSString *const kTextLabelForiOS8 = @"Constains on iOS8";
NSString *const kTextLabelForiOS9 = @"Anchor on iOS9";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initAndSetUpTableView];
}

- (void)initAndSetUpTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kViewControllerCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:kViewControllerCell];
    }
    
    cell.textLabel.text = indexPath.row == 0 ? kTextLabelForiOS8 : kTextLabelForiOS9;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self pageHandlerAtIndex:indexPath.row];
}

- (void)pageHandlerAtIndex:(NSUInteger)index {
    UIViewController *nextPage = [self targetViewControllerAtIndex:index];
    [self pushToNextViewController:nextPage];
}

- (UIViewController *)targetViewControllerAtIndex:(NSUInteger)index {
    return index == 0 ? [[ConstainsViewController alloc] init] : [[AnchorViewController alloc] init];
}

- (void)pushToNextViewController:(UIViewController *)vc {
    [self.navigationController pushViewController:vc animated:YES];
}

@end
