//
//  AddAilmentViewController.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/7/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AilmentCollectionViewController.h"
#import "Ailment.h"
#import "DAO.h"

@class AilmentCollectionViewController;

@interface AddAilmentViewController : UIViewController

@property (nonatomic, retain) DAO *dao;
@property (nonatomic, strong) Ailment *ailment;
@property (nonatomic, weak) IBOutlet UITextField *ailmentName;
@property (nonatomic, strong) AilmentCollectionViewController *ailmentCVC;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (nonatomic ) BOOL detailIsInEditMode;

- (void)saveAilment: (id*)sender;

@end
