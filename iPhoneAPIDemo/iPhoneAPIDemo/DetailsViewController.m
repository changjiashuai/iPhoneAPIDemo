//
//  DetailsViewController.m
//  iPhoneAPIDemo
//
//  Created by CJS on 14-6-2.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)loadView
{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:applicationFrame];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
}

#pragma mark - Action Sheet

-(instancetype)initWithActionSheet
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Action Sheet";
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 320, 40)];
        label.text = @"OK/Cancel";
        label.textAlignment = UITextAlignmentCenter;
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOkCancelActionSheet)];
        [label addGestureRecognizer:tapGesture];
        [self.view addSubview:label];
        
        UILabel *otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 114, 320, 40)];
        otherLabel.text = @"Other";
        otherLabel.textAlignment = UITextAlignmentCenter;
        otherLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *otherTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOtherActionSheet)];
        [otherLabel addGestureRecognizer:otherTapGesture];
        [self.view addSubview:otherLabel];
    }
    return self;
}

-(void)showOkCancelActionSheet
{
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *destructiveButtonTitle = NSLocalizedString(@"OK", nil);
    
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Action Sheet" delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
	[actionSheet showInView:self.view];
}

-(void)showOtherActionSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Action Sheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:@"other", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"%ld", (long)actionSheet.firstOtherButtonIndex);
            break;
            
        default:
            NSLog(@"%@", actionSheet.title);
            break;
    }
}

#pragma mark - Activity Indicator

-(instancetype)initWithActivityIndicator
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Activity Indicator";
        
        [self configureGrayActivityIndicatorView];
        [self configureTintedActivityIndicatorView];
    }
    return self;
}

- (void)configureGrayActivityIndicatorView
{
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 320, 40)];
    grayLabel.textAlignment = UITextAlignmentLeft;
    grayLabel.textColor = [UIColor grayColor];
    grayLabel.text = @"GRAY";
    [self.view addSubview:grayLabel];
    UIActivityIndicatorView *grayStyleActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 120, 320, 40)];
    grayStyleActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    grayStyleActivityIndicatorView.backgroundColor = [UIColor colorWithRed:0.529 green:0.863 blue:0.902 alpha:1.000];
    [grayStyleActivityIndicatorView startAnimating];
    grayStyleActivityIndicatorView.hidesWhenStopped = YES;
    [self.view addSubview:grayStyleActivityIndicatorView];
}

- (void)configureTintedActivityIndicatorView
{
    UILabel *tintedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, 320, 40)];
    tintedLabel.textAlignment = UITextAlignmentLeft;
    tintedLabel.tintColor = [UIColor colorWithRed:0.502 green:0.410 blue:0.488 alpha:1.000];
    tintedLabel.text = @"TINTED";
    [self.view addSubview:tintedLabel];

    UIActivityIndicatorView *tintedActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 200, 320, 40)];
    tintedActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    tintedActivityIndicatorView.color = [UIColor colorWithRed:0.498 green:0.309 blue:0.502 alpha:1.000];
    tintedActivityIndicatorView.backgroundColor = [UIColor colorWithRed:0.529 green:0.863 blue:0.902 alpha:1.000];
    [tintedActivityIndicatorView startAnimating];
    [self.view addSubview:tintedActivityIndicatorView];
}


#pragma mark - AlertView

-(instancetype)initWithAlertView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"AlertView";
    }
    return self;
}

-(instancetype)initWithButton
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithDatePicker
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithImageView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithPageControl
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithPickerView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithProgressView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithSegmentedControl
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithSlider
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithStepper
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithSwitch
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithTextField
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithTextView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithWebView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithSearchBar
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
}

-(instancetype)initWithToolBar
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"";
    }
    return self;
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
