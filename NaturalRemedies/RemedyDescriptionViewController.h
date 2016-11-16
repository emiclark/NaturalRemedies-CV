//
//  RemedyDescriptionViewController.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/13/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Remedies.h"

@interface RemedyDescriptionViewController : UIViewController <UITextFieldDelegate >

@property (nonatomic,strong) Remedy *remedy;
@property (weak, nonatomic) IBOutlet UILabel *remedyName;
@property (weak, nonatomic) IBOutlet UIImageView *remedyImage;
@property (weak, nonatomic) IBOutlet UILabel *remedyType;
@property (weak, nonatomic) IBOutlet UITextView *remedyDescription;

@end
