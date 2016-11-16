//
//  RemedyWebViewController.m
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/10/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "RemedyWebViewController.h"

@interface RemedyWebViewController ()

@end

@implementation RemedyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:self.url];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.webView loadRequest:requestURL];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CGRect viewframe = self.view.frame;
    self.webView.frame = viewframe;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
