//
//  Ailment.m
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//


#import "Ailment.h"

@implementation Ailment


- (id) initWithName:(NSString*)ailmentName andImage:(NSString*)ailmentImage {
self = [super init];
    if (self) {
        self.ailmentName = ailmentName;
        self.ailmentImage = ailmentImage;
        self.remedyList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString * ) description {
    return [NSString stringWithFormat:@"%@", self.ailmentName];
}

@end
