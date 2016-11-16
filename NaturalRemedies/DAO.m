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


- (void) methodToInstantiate{
    //allocate ailmentList
    self.ailmentList = [[NSMutableArray alloc] init];

    // add data
    Ailment *a1 = [[Ailment alloc] initWithName:@"Stress Reduction" andImage:@"stressReduction.jpg"];
    Ailment *a2 = [[Ailment alloc] initWithName:@"Focus and Study" andImage:@"studyIcon.jpg"];
    Ailment *a3 = [[Ailment alloc] initWithName:@"Relaxation and Sleep" andImage:@"sleepIcon.jpg"];
    
    Remedy *r1 = [[Remedy alloc] initWithName: @"Meditation" andDescription:@"CALMING THE MIND:\nSome people think that the purpose of meditation is to stop the mind. They sit, and they try. Soon they get into a fight with their mind, a fight that they lose. Frustrated, they give up. Do you recognize yourself in this scenario?" andType:@"Meditation" andURL:@"https://www.gaiam.com/discover/313/article/calming-mind-meditation-exercise/"];
    
    Remedy *r2 = [[Remedy alloc] initWithName: @"Yoga Poses" andDescription:@"11 Yoga Poses To Calm Your Mind & Invigorate Your Body\nI designed this energizing \"Serenity in the City Sequence\" to help you find some peace and calm, even though your body is constantly moving for the duration. We're so accustomed to being on-the-go all day long, but if we can find a way to keep our mind centered throughout these fluctuating actions, then we have conquered a most difficult task!" andType:@"Body" andURL:@"http://www.mindbodygreen.com/0-18608/11-yoga-poses-to-calm-your-mind-invigorate-your-body.html"];
    
    
    Remedy *r3 = [[Remedy alloc] initWithName: @"Ashwaghanda" andDescription:@"What Is Ashwagandha?\nAshwagandha, one of the most powerful herbs in Ayurvedic healing, has been used since ancient times for a wide variety of conditions, and is most well-known for its restorative benefits. In Sanskrit Ashwagandha means “the smell of a horse,” indicating that the herb imparts the vigor and strength of a stallion, and has traditionally been prescribed to help people strengthen their immune system after an illness." andType:@"Herb" andURL:@"http://www.chopra.com/articles/what-is-ashwagandha"];
    
    Remedy *r4 = [[Remedy alloc] initWithName: @"Brahmi" andDescription:@"5 Health Benefits of Brahmi (Bacopa monnieri)\nA traditional, therapeutic herb native to India, brahmi (also known as Bacopa monnieri) is commonly used in Ayurvedic medicine as a memory enhancer, aphrodisiac, and general tonic." andType:@"Herb" andURL:@"http://www.globalhealingcenter.com/natural-health/health-benefits-of-brahmi-bacopa-monnieri/"];
    
    Remedy *r5 = [[Remedy alloc] initWithName: @"L-theanine" andDescription:@"L-theanine may help relieve stress by inducing a relaxing effect without drowsiness and may also possess immunologic attributes. Theanine may also have effects on the cardiovascular system and play a preventative role in cancer; however, limited clinical information is available to support these claims." andType:@"Supplement" andURL:@"https://www.drugs.com/npc/l-theanine.html"];
    
    
    Remedy *r6 = [[Remedy alloc] initWithName: @"Passion Flower" andDescription:@"Passionflower (Passiflora incarnata) was used traditionally in the Americas and later in Europe as a calming herb for anxiety, insomnia, seizures, and hysteria. It is still used today to treat anxiety and insomnia." andType:@"Herb" andURL:@"http://umm.edu/health/medical/altmed/herb/passionflower"];
    
    Remedy *r7 = [[Remedy alloc] initWithName: @"GABA" andDescription:@"GABA is the most potent depressive neuroamine in human brains. It regulates many of the depressive and sedative actions in brain tissue and is critical for relaxation." andType:@"Supplement" andURL:@"https://examine.com/supplements/gaba/"];
    
    Remedy *r8 = [[Remedy alloc] initWithName: @"test for uitextView" andDescription:@"GABA is the most potent depressive neuroamine in human brains. It regulates many of the depressive and sedative actions in brain tissue and is critical for relaxation.\n\nStack Overflow is a community of 6.3 million programmers, just like you, helping each other.\n\nJoin them. it only takes a minute:\n\nStack Overflow is a community of 6.3 million programmers, just like you, helping each other.\n\nJoin them. it only takes a minute:\n\n\nJoin them. it only takes a minute:\n\nStack Overflow is a community of 6.3 million programmers, just like you, helping each other.\n\nJoin them. it only takes a minute\n\nJoin them. it only takes a minute:\n\nStack Overflow is a community of 6.3 million programmers, just like you, helping each other.\n\nJoin them. it only takes a minute\n\nJoin them. it only takes a minute:\n\nStack Overflow is a community of 6.3 million programmers, just like you, helping each other.\n\nJoin them. it only takes a minute\nZZ" andType:@"Herb" andURL:@""];
    
    [a1.remedyList addObject:r1];
    [a1.remedyList addObject:r2];
    [a1.remedyList addObject:r3];
    [a1.remedyList addObject:r8];
    
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
