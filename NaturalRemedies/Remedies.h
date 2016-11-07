//
//  Remedies.h
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Remedy : NSObject
@property (nonatomic, retain) NSString *remedyName;
@property (nonatomic, retain) NSString *remedyDescription;
@property (nonatomic, retain) NSString *remedyType;
@property (nonatomic, retain) NSString *remedyURL;


- (id)initWithName: (NSString *)remedyName andDescription: (NSString *)remedyDescription andType: (NSString*) remedyType andURL: (NSString*)remedyURL;
@end
