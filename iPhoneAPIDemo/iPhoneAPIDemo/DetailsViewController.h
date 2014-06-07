//
//  DetailsViewController.h
//  iPhoneAPIDemo
//
//  Created by CJS on 14-6-2.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - PickerView
typedef NS_ENUM(NSInteger, PickerViewControllerColorComponent){
    ColorComponentRed = 0,
    ColorComponentGreen,
    ColorComponentBlue,
    ColorComponentCount
};


@interface DetailsViewController : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate>

#pragma mark - DatePicker
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UILabel *dateLabel;

#pragma mark - PageControl
@property (nonatomic, strong) UIScrollView *helpScrView;
@property (nonatomic, strong) UIPageControl *pageCtrl;

#pragma mark - PickerView
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *colorSwatchView;

@property (nonatomic, assign) CGFloat redColorComponent;
@property (nonatomic, assign) CGFloat greenColorComponent;
@property (nonatomic, assign) CGFloat blueColorComponent;

#pragma mark - ProgressView
@property (nonatomic, strong) UIProgressView *defaultStyleProgressView;
@property (nonatomic, strong) UIProgressView *barStyleProgressView;
@property (nonatomic, strong) UIProgressView *tintedProgressView;

@property (nonatomic) NSOperationQueue *operationQueue;
@property (nonatomic) NSUInteger completedProgress;

#pragma mark - SegmentedControl
@property (nonatomic, strong) UISegmentedControl *defaultSegmentedControl;
@property (nonatomic, strong) UISegmentedControl *tintedSegmentedControl;
@property (nonatomic, strong) UISegmentedControl *customSegmentsSegmentedControl;
@property (nonatomic, strong) UISegmentedControl *customBackgroundSegmentedControl;

#pragma mark - Slider
@property (nonatomic, strong) UISlider *defaultSlider;
@property (nonatomic, strong) UISlider *tintedSlider;
@property (nonatomic, strong) UISlider *customSlider;

#pragma mark - Stepper
@property (nonatomic, strong) UIStepper *defaultStepper;
@property (nonatomic, strong) UIStepper *tintedStepper;
@property (nonatomic, strong) UIStepper *customStepper;

@property (nonatomic, strong) UILabel *defaultStepperLabel;
@property (nonatomic, strong) UILabel *tintedStepperLabel;
@property (nonatomic, strong) UILabel *customStepperLabel;

#pragma mark - Switch
@property (nonatomic, strong) UISwitch *defaultSwitch;
@property (nonatomic, strong) UISwitch *tintedSwitch;

#pragma mark - TextField
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextField *tintedTextField;
@property (nonatomic, strong) UITextField *secureTextField;
@property (nonatomic, strong) UITextField *specificKeyboardTextField;
@property (nonatomic, strong) UITextField *customTextField;

#pragma mark - TextView
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) NSLayoutConstraint *textViewBottomLayoutGuideConstraint;

#pragma mark -
-(instancetype)initWithActionSheet;
-(instancetype)initWithActivityIndicator;
-(instancetype)initWithAlertView;
-(instancetype)initWithButton;
-(instancetype)initWithDatePicker;
-(instancetype)initWithImageView;
-(instancetype)initWithPageControl;
-(instancetype)initWithPickerView;
-(instancetype)initWithProgressView;
-(instancetype)initWithSegmentedControl;
-(instancetype)initWithSlider;
-(instancetype)initWithStepper;
-(instancetype)initWithSwitch;
-(instancetype)initWithTextField;
-(instancetype)initWithTextView;
-(instancetype)initWithWebView;
-(instancetype)initWithSearchBar;
-(instancetype)initWithToolBar;


@end
