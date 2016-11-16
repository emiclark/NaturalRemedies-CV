//
//  RemedyCollectionViewController.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/9/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Remedies.h"
#import "CollectionViewCellB.h"
#import "AilmentCollectionViewController.h"
#import "AddRemedyViewController.h"
#import "RemedyDescriptionViewController.h"
#import "RemedyWebViewController.h"

@class AilmentCollectionViewController;

@interface RemedyCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain) DAO  *dao;
@property (nonatomic, strong) AilmentCollectionViewController  *ailmentCVC;
@property (nonatomic, strong) AddRemedyViewController  *addRemedyVC;
@property (nonatomic, strong) NSMutableArray <Remedy *> *remedyList;
@property (strong, nonatomic)  CollectionViewCellB *cell;
@property (nonatomic, strong)   RemedyWebViewController *remedyWebVC;
@property (nonatomic, strong)   RemedyDescriptionViewController *remedyDescriptionVC;
@property  BOOL inEditMode;

- (void) addButtonTapped: (id*) sender;
- (void) editButtonTapped: (id*) sender;
- (IBAction)moreButtonTapped:(UIButton *)sender;


@end
