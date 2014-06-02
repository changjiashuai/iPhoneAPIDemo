//
//  MainViewController.m
//  iPhoneAPIDemo
//
//  Created by CJS on 14-6-2.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "MainViewController.h"
#import "DetailsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:applicationFrame];
    self.view = view;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.titles = @[@"ActionSheet",@"ActivityIndicatorView",@"AlertView",@"Button",@"DatePicker",@"ImageView",@"PageControl",@"PickerView",@"ProgressView",@"SegmentedControl",@"Slider",@"Stepper",@"Switch",@"TextField",@"TextView",@"Label",@"WebView",@"SearchBar",@"Toolbar"];
}

#pragma mark -
#pragma mark UITableViewSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithActionSheet] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithActivityIndicator] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithAlertView] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithButton] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithDatePicker] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithImageView] animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithPageControl] animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithPickerView] animated:YES];
            break;
        case 8:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithProgressView] animated:YES];
            break;
        case 9:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithSegmentedControl] animated:YES];
            break;
        case 10:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithSlider] animated:YES];
            break;
        case 11:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithStepper] animated:YES];
            break;
        case 12:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithSwitch] animated:YES];
            break;
        case 13:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithTextField] animated:YES];
            break;
        case 14:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithTextView] animated:YES];
            break;
        case 15:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithWebView] animated:YES];
            break;
        case 16:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithSearchBar] animated:YES];
            break;
        case 17:
            [self.navigationController pushViewController:[[DetailsViewController alloc] initWithToolBar] animated:YES];
            break;
        default:
            break;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
