//
//  CollectionViewCellA.h
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/6/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCellA : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ailmentImage;
@property (weak, nonatomic) IBOutlet UIImageView *deleteButton;

@end
