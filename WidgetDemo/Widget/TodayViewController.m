//
//  TodayViewController.m
//  Widget
//
//  Created by 黄永军 on 2018/10/30.
//  Copyright © 2018 Seacity. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    if ([[UIDevice currentDevice] systemVersion].intValue >= 10) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
    }
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, 100);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 100)];
    label.text = @"点击logo位置跳转";
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor orangeColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openURLContainingAPP:)];
    [self.view addGestureRecognizer:tap];
}

- (void)openURLContainingAPP:(UITapGestureRecognizer *)sender{
    [self.extensionContext openURL:[NSURL URLWithString:@"SCWidgetDemo_1://hello"]
                 completionHandler:^(BOOL success) {
                     NSLog(@"open url result:%d",success);
                     [self.extensionContext openURL:[NSURL URLWithString:@"SCWidgetDemo_1://hello"] completionHandler:nil];
                 }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
