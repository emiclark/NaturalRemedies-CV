//
//  DAO.m
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "DAO.h"
static DAO *sharedMyManager = nil;

@implementation DAO

- (id) init {
    if (self) {
        [self methodToInstantiate];
    }
    return self;
}


+ (id) sharedManager {
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}


//+ (id) sharedManager {
//    @synchronized (self) {
//        if (sharedMyManager == nil)
//            sharedMyManager = [[self allocWithZone:NULL]init];
//    }
//    return sharedMyManager;
//}
//
//- (id) CopyWithZone: (NSZone *)zone {
//    return self;
//}

- (void) methodToInstantiate{
    //allocate ailmentList
    self.ailmentList = [[NSMutableArray alloc] init];

    // add data
    
    
    
    Ailment *a1 = [[Ailment alloc] initWithName:@"Stress Reduction" andImage:@"stressReduction.jpg"];
    Ailment *a2 = [[Ailment alloc] initWithName:@"Focus and Study" andImage:@"studyIcon.jpg"];
    Ailment *a3 = [[Ailment alloc] initWithName:@"Relaxation and Sleep" andImage:@"sleepIcon.jpg"];
    
    Remedy *r1 = [[Remedy alloc] initWithName: @"Meditation" andDescription:@"Meditation" andType:@"Meditation" andURL:@"https://www.gaiam.com/discover/313/article/calming-mind-meditation-exercise/"];
    
    Remedy *r2 = [[Remedy alloc] initWithName: @"Yoga Breathing" andDescription:@"Meditation" andType:@"Body" andURL:@"http://www.mindbodygreen.com/0-18608/11-yoga-poses-to-calm-your-mind-invigorate-your-body.html"];
    
    
    Remedy *r3 = [[Remedy alloc] initWithName: @"Ashwaghanda" andDescription:@"Ayuverdic herb for stress and  stamina" andType:@"Herb" andURL:@"https://en.wikipedia.org/wiki/Withania_somnifera"];
    
    Remedy *r4 = [[Remedy alloc] initWithName: @"Brahmi" andDescription:@"Ayuverdic herb for mental focus" andType:@"Herb" andURL:@"https://en.wikipedia.org/wiki/Bacopa_monnieri"];
    
    Remedy *r5 = [[Remedy alloc] initWithName: @"L-theanine" andDescription:@"Supplement" andType:@"Supplement" andURL:@"https://en.wikipedia.org/wiki/Theanine"];
    
    
    Remedy *r6 = [[Remedy alloc] initWithName: @"Passion Flower" andDescription:@"Herb for calming the mind and body" andType:@"Herb" andURL:@"https://en.wikipedia.org/wiki/Passiflora"];
    
    Remedy *r7 = [[Remedy alloc] initWithName: @"GABA" andDescription:@"Herb for calming the mind and body" andType:@"Supplement" andURL:@"http://www.webmd.com/vitamins-and-supplements/gaba-uses-and-risks"];
    
    [a1.remedyList addObject:r1];
    [a1.remedyList addObject:r2];
    [a1.remedyList addObject:r3];
    
    [a2.remedyList addObject:r4];
    [a2.remedyList addObject:r5];
    
    [a3.remedyList addObject:r6];
    [a3.remedyList addObject:r7];
    
    [self.ailmentList addObject:a1];
    [self.ailmentList addObject:a2];
    [self.ailmentList addObject:a3];
    
    NSLog(@"%@",self.ailmentList);
    
}

@end
