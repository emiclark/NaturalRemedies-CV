//
//  AddRemedyViewController.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/10/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Remedies.h"

@interface AddRemedyViewController : UIViewController 

@property (nonatomic) BOOL inEditMode;
@property (nonatomic, strong) Remedy *remedy;
@property (nonatomic, strong) NSMutableArray *remedyList;
@property (weak, nonatomic) IBOutlet UITextField *remedyName;
@property (weak, nonatomic) IBOutlet UITextView *remedyDescription;
@property (weak, nonatomic) IBOutlet UITextField *remedyURL;
@property (weak, nonatomic) IBOutlet UISegmentedControl *remedyTypeSC;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

- (void ) saveButtonTapped: (id*) sender;
@end
