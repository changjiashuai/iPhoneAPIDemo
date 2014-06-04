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
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, applicationFrame.size.height - 64)];
    NSLog(@"%f",applicationFrame.size.height - 64);
    scrollView.contentSize = CGSizeMake(320, 640);
//    scrollView.delegate = self;
//    scrollView.pagingEnabled = YES;
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
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
        
        UIButton *simpleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        simpleButton.frame = CGRectMake(0, 80, 320, 40);
        [simpleButton setTitle:@"SimpleAlert" forState:UIControlStateNormal];
        [simpleButton addTarget:self action:@selector(showSimpleAlert) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:simpleButton];
        
        UIButton *okCancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        okCancelButton.frame = CGRectMake(0, 120, 320, 40);
        [okCancelButton setTitle:@"OkCancelAlert" forState:UIControlStateNormal];
        [okCancelButton addTarget:self action:@selector(showOkCancelAlert) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:okCancelButton];
        
        UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        otherButton.frame = CGRectMake(0, 160, 320, 40);
        [otherButton setTitle:@"OtherAlert" forState:UIControlStateNormal];
        [otherButton addTarget:self action:@selector(showOtherAlert) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:otherButton];
        
        UIButton *textEntryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        textEntryButton.frame = CGRectMake(0, 200, 320, 40);
        [textEntryButton setTitle:@"TextEntryAlert" forState:UIControlStateNormal];
        [textEntryButton addTarget:self action:@selector(showTextEntryAlert) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:textEntryButton];
        
        UIButton *secureTextEntryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        secureTextEntryButton.frame = CGRectMake(0, 240, 320, 40);
        [secureTextEntryButton setTitle:@"SecureTextEntryAlert" forState:UIControlStateNormal];
        [secureTextEntryButton addTarget:self action:@selector(showSecureTextEntryAlert) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:secureTextEntryButton];
    }
    return self;
}

-(void)showSimpleAlert
{
    NSString *title = NSLocalizedString(@"A Short Title", nil);
    NSString *message = NSLocalizedString(@"A message", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:@"ohter", nil];
    [alertView show];
}

-(void)showOkCancelAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

-(void)showOtherAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Ohter One",@"Ohter Two", nil];
    [alertView show];
}

-(void)showTextEntryAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}

-(void)showSecureTextEntryAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alertView show];
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.cancelButtonIndex == buttonIndex) {
        NSLog(@"Alert view clicked with the cancel button index");
    }else{
        NSLog(@"Alert view clicked with button at index %ld", (long)buttonIndex);
    }
}

-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    //强制返回5个字符为Secure Text
    if (alertView.alertViewStyle == UIAlertViewStyleSecureTextInput) {
        return [[alertView textFieldAtIndex:0].text length] >= 5;
    }
    return YES;
}


#pragma mark - Button

-(instancetype)initWithButton
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Button";
        [self configureSystemTextButton];
        [self configureSystemContactAddButton];
        [self configureSystemDetailDisclosureButton];
        [self configureImageButton];
        [self configureAttributedTextSystemButton];
    }
    return self;
}

-(void)configureSystemTextButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 80, 320, 40);
    [button setTitle:@"Button" forState:UIControlStateNormal];
    button.layer.borderWidth = 0.5;
    [self.view addSubview:button];
}

-(void)configureSystemContactAddButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(0, 140, 320, 40);
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderWidth = 0.5;
    [self.view addSubview:button];
}

-(void)configureSystemDetailDisclosureButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    button.frame = CGRectMake(0, 200, 320, 40);
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderWidth = 0.5;
    [self.view addSubview:button];
}

-(void)configureImageButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 260, 320, 40);
    [button setImage:[UIImage imageNamed:@"x_icon"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderWidth = 0.5;
    // 设置圆角
    button.layer.cornerRadius = 0.0;
    // 设置颜色空间为rgb，用于生成ColorRef
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    // 新建一个红色的ColorRef，用于设置边框（四个数字分别是 r, g, b, alpha）
//    CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 0.3, 0.3, 0, 1 });
//    // 设置边框颜色
//    button.layer.borderColor = borderColorRef;
    [self.view addSubview:button];
}

-(void)configureAttributedTextSystemButton
{
    
    NSDictionary *titleAttributes = @{NSForegroundColorAttributeName: [UIColor redColor], NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)};
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Button", nil) attributes:titleAttributes];
    
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 320, 320, 40);
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderWidth = 0.5;
    
    
    [button setAttributedTitle:attributedTitle forState:UIControlStateNormal];
    
    NSDictionary *highlightedTitleAttributes = @{NSForegroundColorAttributeName : [UIColor orangeColor], NSStrikethroughStyleAttributeName: @(NSUnderlineStyleThick)};
    NSAttributedString *highlightedAttributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Button", nil) attributes:highlightedTitleAttributes];
    [button setAttributedTitle:highlightedAttributedTitle forState:UIControlStateHighlighted];
    
    [self.view addSubview:button];
}


#pragma mark - Date Picker

-(instancetype)initWithDatePicker
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Date Picker";
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        _dateFormatter.timeStyle = NSDateFormatterShortStyle;

        
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.frame = CGRectMake(0, 400, 320, 40);
        _dateLabel.textAlignment = UITextAlignmentCenter;
        [self.view addSubview:_dateLabel];

        
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
        [_datePicker addTarget:self action:@selector(updateDatePickerLabel) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker];
        [self updateDatePickerLabel];
        
    }
    return self;
}

-(void)updateDatePickerLabel
{
    _dateLabel.text = [self.dateFormatter stringFromDate:self.datePicker.date];
}



#pragma mark - ImageView

-(instancetype)initWithImageView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"ImageView";
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
