//
//  CollectionViewCellB.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/9/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCellB : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *remedyImage;
@property (weak, nonatomic) IBOutlet UILabel *remedyName;
@property (weak, nonatomic) IBOutlet UILabel *remedyDescription;
@property (weak, nonatomic) IBOutlet UILabel *remedyType;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;



@end


