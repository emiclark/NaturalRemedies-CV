//
//  RemedyDescriptionViewController.m
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/13/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "RemedyDescriptionViewController.h"

@interface RemedyDescriptionViewController ()

@end

@implementation RemedyDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.remedyName.text = self.remedy.remedyName;
    NSLog(@"remedyDescription: %@",self.remedy.remedyDescription);

    self.remedyDescription.showsVerticalScrollIndicator = YES;
    self.remedyDescription.text = self.remedy.remedyDescription;
    
    self.remedyType.text = self.remedy.remedyType;
    
    if ([self.remedy.remedyType  isEqual: @"Herb"]) {
        self.remedyImage.image = [UIImage imageNamed:@"herb.png"];
    }
    else if ([self.remedy.remedyType isEqual: @"Supplement"]) {
        self.remedyImage.image = [UIImage imageNamed:@"supplement.png"];
    }
    else if ([self.remedy.remedyType isEqual: @"Meditation"]) {
        self.remedyImage.image = [UIImage imageNamed:@"meditation.png"];
    }
    else if ([self.remedy.remedyType isEqual: @"Body"]) {
        self.remedyType.text = @"Body and Movement";
        self.remedyImage.image = [UIImage imageNamed:@"yoga.png"];
    }
        
    // make text content size equal to uitextview size
    self.remedyDescription.contentSize = CGSizeMake(self.remedyDescription.frame.size.height,self.remedyDescription.contentSize.height);
}

- (void)viewDidLayoutSubviews {
//    [self.remedyDescription scrollRangeToVisible:NSMakeRange(0, 0)];
    [self.remedyDescription setContentOffset:CGPointZero];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
