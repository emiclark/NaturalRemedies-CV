//
//  Remedies.m
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//


#import "Remedies.h"

@implementation Remedy

- (id)initWithName: (NSString *)remedyName andDescription: (NSString *)remedyDescription andType: (NSString*) remedyType andURL: (NSString*)remedyURL {
    self=[super init];
    if (self) {
        self.remedyName = remedyName;
        self.remedyDescription = remedyDescription;
        self.remedyType = remedyType;
        self.remedyURL = remedyURL;
    }
    return  self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"remedy: %@ - %@, %@, %@",self.remedyName, self.remedyDescription, self.remedyType, self.remedyURL];
}

@end
