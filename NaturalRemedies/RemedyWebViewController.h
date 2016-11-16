//
//  RemedyWebViewController.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/10/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Webkit/WebKit.h"

@interface RemedyWebViewController : UIViewController

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSURL *url;

@end
