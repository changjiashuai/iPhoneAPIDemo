//
//  DetailsViewController.h
//  iPhoneAPIDemo
//
//  Created by CJS on 14-6-2.
//  Copyright (c) 2014年 常家帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController <UIActionSheetDelegate>

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
