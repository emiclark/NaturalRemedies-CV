//
//  DAO.h
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ailment.h"
#import "Remedies.h"

@interface DAO : NSObject

@property (nonatomic, retain) NSMutableArray <Ailment *> *ailmentList;

+ (id) sharedManager;
- (void) methodToInstantiate;

@end
