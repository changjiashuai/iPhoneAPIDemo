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
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
        imageView.animationImages = @[
            [UIImage imageNamed:@"image_animal_1"],
            [UIImage imageNamed:@"image_animal_2"],
            [UIImage imageNamed:@"image_animal_3"],
            [UIImage imageNamed:@"image_animal_4"],
            [UIImage imageNamed:@"image_animal_5"],
        ];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.animationDuration = 5;
        [imageView startAnimating];
        
        imageView.isAccessibilityElement = YES;
        imageView.accessibilityLabel = @"Animated";
        [self.view addSubview:imageView];
    }
    return self;
}


#pragma mark - PageControl

-(instancetype)initWithPageControl
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"PageControll";
        CGRect bounds = self.view.frame; //获取界面区域
        
        bounds.origin.y = 0.0f;
        
        //加载蒙版图片
        //创建UIImageView，位置大小与主界面一样
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height)];
        [imageView1 setBackgroundColor:[UIColor redColor]];
        imageView1.alpha = 0.5f;//透明度设为50%
        
        UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(bounds.origin.x + bounds.size.width, bounds.origin.y, bounds.size.width, bounds.size.height)];
        [imageView2 setBackgroundColor:[UIColor greenColor]];
        imageView2.alpha = 0.5f;//透明度设为50%
        
        UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(bounds.origin.x + bounds.size.width * 2, bounds.origin.y, bounds.size.width, bounds.size.height)];
        [imageView3 setBackgroundColor:[UIColor blueColor]];
        imageView3.alpha = 0.5f;//透明度设为50%
        
        //创建UIScrollView，位置大小与主界面一样
        _helpScrView = [[UIScrollView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height)];
        //设置全部内容尺寸，这里帮助图片是3张，所以设置宽度为界面宽度 * 3，高度和界面一致。
        [_helpScrView setContentSize:CGSizeMake(bounds.size.width * 3, bounds.size.height)];
        _helpScrView.pagingEnabled = YES; //设置为YES，会按页滑动
        _helpScrView.bounces = NO; //取消UIScrollView的弹性属性
        [_helpScrView setDelegate:self];  //设置代理
        _helpScrView.showsHorizontalScrollIndicator = NO; //使用UIPageControl表示页面进度，取消水平滚动条
        [_helpScrView addSubview:imageView1];  //将UIImageView添加到UIScrollView中
        [_helpScrView addSubview:imageView2];
        [_helpScrView addSubview:imageView3];
        [self.view addSubview:_helpScrView]; //将UIScrollView添加到主界面上
        
        //创建UIPageControl,在屏幕最下方
        _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, bounds.size.height - 100, bounds.size.width, 30)];
        _pageCtrl.numberOfPages = 3; //总的图片页数
        _pageCtrl.currentPage = 0;   //当前页
        [_pageCtrl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];  //用户点击UIPageControl的响应函数
        [self.view addSubview:_pageCtrl];  //将UIPageControl添加到主界面上
        
        
    }
    return self;
}

-(void)pageTurn:(UIPageControl *)pageCtrl
{
    //令UIScrollView做出响应的滑动显示
    CGSize viewSize = _helpScrView.frame.size;
    CGRect rect = CGRectMake(pageCtrl.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [_helpScrView scrollRectToVisible:rect animated:YES];
}

#pragma mark - UIScrollViewDelegate Method

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //用户滑动页面停下后调用
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageCtrl setCurrentPage:offset.x / bounds.size.width];
}


#pragma mark - PickerView

-(instancetype)initWithPickerView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Picker View";
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, 320, 162)];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.pickerView.showsSelectionIndicator = YES;
        [self.view addSubview:_pickerView];
        [self configurePickerView];
        
        _colorSwatchView = [[UIView alloc] initWithFrame:CGRectMake(20, 200, 280, 300)];
        _colorSwatchView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_colorSwatchView];
    }
    return self;
}

//颜色偏移值
- (NSInteger)colorValueOffset
{
    return 5;
}

- (NSInteger)numberOfColorValuesPerComponent
{
    return (NSInteger)ceil(255.0 / (CGFloat)[self colorValueOffset]) + 1;
}

- (void)updateColorSwatchViewBackgroundColor
{
    self.colorSwatchView.backgroundColor = [UIColor colorWithRed:self.redColorComponent green:self.greenColorComponent blue:self.blueColorComponent alpha:1];
}

#pragma mark - Configureation

-(void)configurePickerView
{
    [self selectRowInPickerView:13 withColorComponent:ColorComponentRed];
    [self selectRowInPickerView:41 withColorComponent:ColorComponentGreen];
    [self selectRowInPickerView:24 withColorComponent:ColorComponentBlue];
}

-(void)selectRowInPickerView:(NSInteger)row withColorComponent:(PickerViewControllerColorComponent)colorComponent
{
    [self.pickerView selectRow:row inComponent:(NSInteger)colorComponent animated:YES];
    [self pickerView:self.pickerView didSelectRow:row inComponent:(NSInteger)colorComponent];
}

#pragma mark - RGB Color Setter Overrides

- (void)setRedColorComponent:(CGFloat)redColorComponent
{
    if (_redColorComponent != redColorComponent) {
        _redColorComponent = redColorComponent;
        [self updateColorSwatchViewBackgroundColor];
    }
}

- (void)setGreenColorComponent:(CGFloat)greenColorComponent
{
    if (_greenColorComponent != greenColorComponent) {
        _greenColorComponent = greenColorComponent;
        [self updateColorSwatchViewBackgroundColor];
    }
}

- (void)setBlueColorComponent:(CGFloat)blueColorComponent
{
    if (_blueColorComponent != blueColorComponent) {
        _blueColorComponent = blueColorComponent;
        [self updateColorSwatchViewBackgroundColor];
    }
}

#pragma mark - UIPickerViewDataSource

/**
 *  显示3列
 *
 *  @param pickerView 当前控件
 *
 *  @return 返回列数
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return ColorComponentCount;
}

/**
 *  每列有多少行数据
 *
 *  @param pickerView 当前控件
 *  @param component  当前列
 *
 *  @return 返回每列的行数
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self numberOfColorValuesPerComponent];
}

#pragma mark - UIPickerViewDelegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSInteger colorValue = row * [self colorValueOffset];
    
    CGFloat colorComponent = (CGFloat)colorValue / 255.0;
    CGFloat redColorComponent = 0;
    CGFloat greenColorComponent = 0;
    CGFloat blueColorComponent = 0;
    
    switch (component) {
        case ColorComponentRed:
            redColorComponent = colorComponent;
            break;
        case ColorComponentGreen:
            greenColorComponent = colorComponent;
            break;
        case ColorComponentBlue:
            blueColorComponent = colorComponent;
            break;
            
        default:
            NSLog(@"Invalid row/component");
            break;
    }
    
    UIColor *foregroundColor = [UIColor colorWithRed:redColorComponent green:greenColorComponent blue:blueColorComponent alpha:1];
    
    NSString *titleText = [NSString stringWithFormat:@"%ld", (long)colorValue];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: foregroundColor};
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:titleText attributes:attributes];
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CGFloat colorComponentValue = ((CGFloat)[self colorValueOffset] * row) / 255.0;
    
    switch (component) {
        case ColorComponentRed:
            self.redColorComponent = colorComponentValue;
            break;
        case ColorComponentGreen:
            self.greenColorComponent = colorComponentValue;
            break;
        case ColorComponentBlue:
            self.blueColorComponent = colorComponentValue;
            break;
            
        default:
            break;
    }
}


#pragma mark - Progress View

-(instancetype)initWithProgressView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Progress View";
        self.completedProgress = 0;
        [self configureDefaultStyleProgressView];
        [self configureBarStyleProgressView];
        [self configureTintedProgressView];
        
        [self simulateProgress];
    }
    return self;
}

#pragma mark - Overrides

-(void)setCompletedProgress:(NSUInteger)completedProgress
{
    if (_completedProgress != completedProgress) {
        float fractionalProgress = (float)completedProgress / 100.0f;
        
        [self.defaultStyleProgressView setProgress:fractionalProgress animated:YES];
        [self.barStyleProgressView setProgress:fractionalProgress animated:YES];
        [self.tintedProgressView setProgress:fractionalProgress animated:YES];
        _completedProgress = completedProgress;
    }
}

#pragma mark - Configuration

-(void)configureDefaultStyleProgressView
{
    _defaultStyleProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 30, 320, 40)];
    _defaultStyleProgressView.progressViewStyle = UIProgressViewStyleDefault;
    [self.view addSubview:_defaultStyleProgressView];
}

-(void)configureBarStyleProgressView
{
    _barStyleProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 80, 320, 40)];
    _barStyleProgressView.progressViewStyle = UIProgressViewStyleBar;
    [self.view addSubview:_barStyleProgressView];
}

-(void)configureTintedProgressView
{
    _tintedProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 130, 320, 40)];
    _tintedProgressView.progressViewStyle = UIProgressViewStyleDefault;
    _tintedProgressView.trackTintColor = [UIColor colorWithRed:0.413 green:0.298 blue:1.000 alpha:1.000];
    _tintedProgressView.progressTintColor = [UIColor colorWithRed:0.413 green:0.298 blue:1.000 alpha:1.000];
    [self.view addSubview:_tintedProgressView];
}

#pragma mark - Progress Simulation

-(void)simulateProgress
{
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    for (NSUInteger count = 0; count < 100; count++) {
        [self.operationQueue addOperationWithBlock:^{
            sleep(arc4random_uniform(10));
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.completedProgress++;
            }];
        }];
    }
}


#pragma mark - SegmentControl

-(instancetype)initWithSegmentedControl
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"SegmentControl";
        [self configureDefaultSegmentedControl];
        [self configureTintedSegmentedControl];
        [self configureCustomSegmentsSegmentedControl];
        [self configureCustomBackgroundSegmentedControl];
    }
    return self;
}

#pragma mark - Configuration

-(void)configureDefaultSegmentedControl
{
    _defaultSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two", @"three"]];
    self.defaultSegmentedControl.frame = CGRectMake(0, 30, 320, 40);
    self.defaultSegmentedControl.momentary = YES;
    [self.defaultSegmentedControl setEnabled:NO forSegmentAtIndex:0];
    [self.defaultSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_defaultSegmentedControl];
}

-(void)configureTintedSegmentedControl
{
    _tintedSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two", @"three"]];
    self.tintedSegmentedControl.frame = CGRectMake(0, 80, 320, 40);
    self.tintedSegmentedControl.tintColor = [UIColor colorWithRed:0.421 green:0.815 blue:1.000 alpha:1.000];
    [self.tintedSegmentedControl setSelectedSegmentIndex:1];
    [self.tintedSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_tintedSegmentedControl];
}

-(void)configureCustomSegmentsSegmentedControl
{
    self.customSegmentsSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"", @"", @""]];
    UIImage *checkmarkImage = [UIImage imageNamed:@"checkmark_icon"];
    [self.customSegmentsSegmentedControl setImage:checkmarkImage forSegmentAtIndex:0];
    
    UIImage *searchImage = [UIImage imageNamed:@"search_icon"];
    [self.customSegmentsSegmentedControl setImage:searchImage forSegmentAtIndex:1];
    
    UIImage *toolsImage = [UIImage imageNamed:@"tools_icon"];
    [self.customSegmentsSegmentedControl setImage:toolsImage forSegmentAtIndex:2];
    
    self.customSegmentsSegmentedControl.selectedSegmentIndex = 0;
    [self.customSegmentsSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
    self.customSegmentsSegmentedControl.frame = CGRectMake(0, 130, 320, 40);
    [self.view addSubview:_customSegmentsSegmentedControl];
}

-(void)configureCustomBackgroundSegmentedControl
{
    _customBackgroundSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two", @"three"]];
    
    self.customBackgroundSegmentedControl.selectedSegmentIndex = 2;
    self.customBackgroundSegmentedControl.frame = CGRectMake(0, 180, 320, 40);
    
    [self.customBackgroundSegmentedControl setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [self.customBackgroundSegmentedControl setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_disabled"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    
    [self.customBackgroundSegmentedControl setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_highlighted"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [self.customBackgroundSegmentedControl setDividerImage:[UIImage imageNamed:@"stepper_and_segment_segment_divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIFontDescriptor *captionFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption1];
    UIFont *font = [UIFont fontWithDescriptor:captionFontDescriptor size:0];
    
    NSDictionary *normalTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor], NSFontAttributeName: font};
    [self.customBackgroundSegmentedControl setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    
    NSDictionary *highlightedTextAttributes = @{NSForegroundColorAttributeName: [UIColor orangeColor], NSFontAttributeName:font};
    
    [self.customBackgroundSegmentedControl setTitleTextAttributes:highlightedTextAttributes forState:UIControlStateHighlighted];
    
    [self.customBackgroundSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_customBackgroundSegmentedControl];
}

#pragma mark - SegmentedControl Actions

- (void)selectedSegmentDidChange:(UISegmentedControl *)segmentedControl
{
    NSLog(@"The selected segment changed for: %@.", segmentedControl);
}


#pragma mark - Slider

-(instancetype)initWithSlider
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Slider";
        [self configureDefaultSlider];
        [self configureTintedSlider];
        [self configureCustomSlider];
    }
    return self;
}

#pragma mark - Configuration

-(void)configureDefaultSlider
{
    self.defaultSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 30, 320, 40)];
    self.defaultSlider.minimumValue = 0;
    self.defaultSlider.maximumValue = 100;
    self.defaultSlider.value = 42;
    self.defaultSlider.continuous = YES;
    
    [self.defaultSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.defaultSlider];
}

-(void)configureTintedSlider
{
    self.tintedSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 80, 320, 40)];
    self.tintedSlider.minimumTrackTintColor = [UIColor orangeColor];
    self.tintedSlider.maximumTrackTintColor = [UIColor purpleColor];
    [self.tintedSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.tintedSlider];
}

-(void)configureCustomSlider
{
    self.customSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 130, 320, 40)];
    UIImage *leftTrackImage = [UIImage imageNamed:@"slider_blue_track"];
    [self.customSlider setMinimumTrackImage:leftTrackImage forState:UIControlStateNormal];
    
    UIImage *rightTrackImage = [UIImage imageNamed:@"slider_green_track"];
    [self.customSlider setMaximumTrackImage:rightTrackImage forState:UIControlStateNormal];
    
    UIImage *thumbImage = [UIImage imageNamed:@"slider_thumb"];
    [self.customSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    
    self.customSlider.minimumValue = 0;
    self.customSlider.maximumValue = 100;
    self.customSlider.continuous = NO;
    self.customSlider.value = 84;
    
    [self.customSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.customSlider];
}

#pragma mark - Slider Actions

- (void)sliderValueDidChange:(UISlider *)slider
{
    NSLog(@"A slider changed its value: %@", slider);
}


#pragma mark - Stepper

-(instancetype)initWithStepper
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Stepper";
        [self configureDefaultStepper];
        [self configureTintedStepper];
        [self configureCustomStepper];
    }
    return self;
}

#pragma mark - Configuration

-(void)configureDefaultStepper
{
    self.defaultStepper = [[UIStepper alloc] initWithFrame:CGRectMake(100, 30, 120, 40)];
    self.defaultStepper.minimumValue = 0;
    self.defaultStepper.maximumValue = 10;
    self.defaultStepper.stepValue = 1;
    
    self.defaultStepperLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 26, 80, 40)];
    self.defaultStepperLabel.text = [NSString stringWithFormat:@"%ld", (long)self.defaultStepper.value];
    [self.defaultStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.defaultStepperLabel];
    [self.view addSubview:self.defaultStepper];
}

-(void)configureTintedStepper
{
    self.tintedStepper = [[UIStepper alloc] initWithFrame:CGRectMake(100, 80, 120, 40)];
    self.tintedStepper.tintColor = [UIColor purpleColor];
    self.tintedStepperLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 70, 80, 40)];
    self.tintedStepperLabel.text = [NSString stringWithFormat:@"%ld", (long)self.tintedStepper.value];
    [self.tintedStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.tintedStepperLabel];
    [self.view addSubview:self.tintedStepper];
}

-(void)configureCustomStepper
{
    self.customStepper = [[UIStepper alloc] initWithFrame:CGRectMake(100, 130, 120, 40)];
    [self.customStepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background"] forState:UIControlStateNormal];
    [self.customStepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_highlighted"] forState:UIControlStateHighlighted];
    [self.customStepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_disabled"] forState:UIControlStateDisabled];
    
    [self.customStepper setDividerImage:[UIImage imageNamed:@"stepper_and_segment_divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    [self.customStepper setIncrementImage:[UIImage imageNamed:@"stepper_increment"] forState:UIControlStateNormal];
    [self.customStepper setDecrementImage:[UIImage imageNamed:@"stepper_decrement"] forState:UIControlStateNormal];
    self.customStepperLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 120, 80, 40)];
    self.customStepperLabel.text = [NSString stringWithFormat:@"%ld", (long)self.customStepper.value];
    [self.customStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.customStepper];
    [self.view addSubview:self.customStepperLabel];
}

#pragma mark - Stepper Actions

- (void)stepperValueDidChange:(UIStepper *)stepper {
    NSLog(@"A stepper changed its value: %@.", stepper);
    
    // Figure out which stepper was selected and update its associated label.
    UILabel *stepperLabel;
    if (self.defaultStepper == stepper) {
        stepperLabel = self.defaultStepperLabel;
    }
    else if (self.tintedStepper == stepper) {
        stepperLabel = self.tintedStepperLabel;
    }
    else if (self.customStepper == stepper) {
        stepperLabel = self.customStepperLabel;
    }
    
    stepperLabel.text = [NSString stringWithFormat:@"%ld", (long)stepper.value];
}


#pragma mark - Switch

-(instancetype)initWithSwitch
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"Switch";
        [self configureDefaultSwitch];
        [self configureTintedSwitch];
    }
    return self;
}

#pragma mark - Configuration

-(void)configureDefaultSwitch
{
    self.defaultSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(134.5, 30, 51, 40)];
    [self.defaultSwitch setOn:YES animated:YES];
    [self.defaultSwitch addTarget:self action:@selector(switchValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.defaultSwitch];
}

-(void)configureTintedSwitch
{
    self.tintedSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(134.5, 80, 51, 40)];
    self.tintedSwitch.tintColor = [UIColor purpleColor];
    self.tintedSwitch.onTintColor = [UIColor orangeColor];
    self.tintedSwitch.thumbTintColor = [UIColor blueColor];
    [self.tintedSwitch addTarget:self action:@selector(switchValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.tintedSwitch];
}

#pragma mark - Switch Actions

-(void)switchValueDidChange:(UISwitch *)aSwitch
{
    NSLog(@"A switch changed its value: %@.", aSwitch);
}


#pragma mark - TextField

-(instancetype)initWithTextField
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"TextField";
        
        [self configureTextField];
        [self configureTintedTextField];
        [self configureSecureTextField];
        [self configureSpecificKeyboardTextField];
        [self configureCustomTextField];
    }
    return self;
}

#pragma mark - Configuration

-(void)configureTextField
{
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 30, 320, 40)];
    self.textField.placeholder = @"Placeholder text";
    self.textField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.clearButtonMode = UITextFieldViewModeNever;
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
}

-(void)configureTintedTextField
{
    self.tintedTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 80, 320, 40)];
    self.tintedTextField.tintColor = [UIColor purpleColor];
    self.tintedTextField.textColor = [UIColor orangeColor];
    self.tintedTextField.placeholder = @"Placeholder text";
    self.tintedTextField.returnKeyType = UIReturnKeyDone;
    self.tintedTextField.clearButtonMode = UITextFieldViewModeNever;
    self.tintedTextField.delegate = self;
    self.tintedTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.tintedTextField];
}

-(void)configureSecureTextField
{
    self.secureTextField =[[UITextField alloc] initWithFrame:CGRectMake(0, 130, 320, 40)];
    self.secureTextField.secureTextEntry = YES;
    self.secureTextField.placeholder = @"Placeholder text";
    self.secureTextField.returnKeyType = UIReturnKeyDone;
    self.secureTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.secureTextField.delegate = self;
    self.secureTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.secureTextField];
}

-(void)configureSpecificKeyboardTextField;
{
    self.specificKeyboardTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 180, 320, 40)];
    self.specificKeyboardTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.specificKeyboardTextField.placeholder = @"Placeholder text";
    self.specificKeyboardTextField.returnKeyType = UIReturnKeyDone;
    self.specificKeyboardTextField.delegate = self;
    self.specificKeyboardTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.specificKeyboardTextField];
}

-(void)configureCustomTextField
{
    self.customTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 230, 320, 40)];
    self.customTextField.borderStyle = UITextBorderStyleNone;
    self.customTextField.background = [UIImage imageNamed:@"text_field_background"];
    
    UIImage *purpleImage = [UIImage imageNamed:@"text_field_purple_right_view"];
    UIButton *purpleImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    purpleImageButton.bounds = CGRectMake(0, 0, purpleImage.size.width, purpleImage.size.height);
    purpleImageButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [purpleImageButton setImage:purpleImage forState:UIControlStateNormal];
    [purpleImageButton addTarget:self action:@selector(customTextFieldPurpleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.customTextField.rightView = purpleImageButton;
    self.customTextField.rightViewMode = UITextFieldViewModeAlways;
    
    UIView *leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    leftPaddingView.backgroundColor = [UIColor clearColor];
    self.customTextField.leftView = leftPaddingView;
    self.customTextField.leftViewMode = UITextFieldViewModeAlways;
    self.customTextField.placeholder = @"Placeholder text";
    self.customTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.customTextField.returnKeyType = UIReturnKeyDone;
    self.customTextField.delegate = self;
    [self.view addSubview:self.customTextField];
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - CustomTextField Actions

- (void)customTextFieldPurpleButtonClicked {
    self.customTextField.textColor = [UIColor purpleColor];
    
    NSLog(@"The custom text field's purple right view button was clicked.");
}


-(instancetype)initWithTextView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"TextView";
    }
    return self;
}

-(instancetype)initWithWebView
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"WebView";
    }
    return self;
}

-(instancetype)initWithSearchBar
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"SearchBar";
    }
    return self;
}

-(instancetype)initWithToolBar
{
    if (self = [super init]) {
        //
        self.navigationItem.title = @"ToolBar";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
