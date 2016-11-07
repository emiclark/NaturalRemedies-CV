//
//  AilmentCollectionViewController.h
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "CollectionViewCellA.h"

@interface AilmentCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain) DAO *dao;
@property (strong, nonatomic) IBOutlet UICollectionView *ailmentCV;
@property (nonatomic, strong) CollectionViewCellA *myCell;
@property (nonatomic, strong) NSMutableArray<CollectionViewCellA *> *ailmentCells;
- (void) editDeleteButtonTapped: (id*) sender;

@end
