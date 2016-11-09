//
//  Ailment.h
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Remedies.h"

@interface Ailment : NSObject

@property (nonatomic, retain) NSString *ailmentName;
@property (nonatomic, retain) NSString *ailmentImage;
@property (nonatomic, retain) NSMutableArray <Remedy *> *remedyList;

- (id) initWithName:(NSString*)ailmentName andImage:(NSString*)ailmentImage;

@end
