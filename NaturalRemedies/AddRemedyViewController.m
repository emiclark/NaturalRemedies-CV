//
//  AddRemedyViewController.m
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/10/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "AddRemedyViewController.h"

@interface AddRemedyViewController ()

@end

@implementation AddRemedyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonTapped:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    // edit mode: fill in text fields
    if (self.inEditMode == YES) {
        self.remedyName.text = self.remedy.remedyName;
        self.remedyDescription.text = self.remedy.remedyDescription;
        self.remedyURL.text = self.remedy.remedyURL;
        
        // set segmentedController to correct item
        if ([self.remedy.remedyType isEqual: @"Meditation"]) {
            self.remedyTypeSC.selectedSegmentIndex = 0;
        }
        else if ([self.remedy.remedyType isEqual: @"Herb"]) {
            self.remedyTypeSC.selectedSegmentIndex = 1;
        }
        else if ([self.remedy.remedyType isEqual: @"Supplement"]) {
            self.remedyTypeSC.selectedSegmentIndex = 2;
        }
        else if ([self.remedy.remedyType isEqual: @"Body"]) {
            self.remedyTypeSC.selectedSegmentIndex = 3;
        }
        
        // make Delete Button visible
        self.deleteButton.hidden = NO;
    }
    // in ADD mode: hide Delete Button
    else {
        self.deleteButton.hidden = YES;
        self.remedyTypeSC.selectedSegmentIndex = 0;
    }
}

#pragma mark Button Tapped

- (IBAction)deleteButtonTapped:(UIButton *)sender {
    [self.remedyList removeObject:self.remedy];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) saveButtonTapped: (id*) sender {
    
    // in ADD mode: allocate Remedy object
    if (self.inEditMode == NO) {
        self.remedy = [[Remedy alloc] init];
    }
    
    // set remedyType
    if (self.remedyTypeSC.selectedSegmentIndex == 0) {
        self.remedy.remedyType = @"Meditation";
    }
    else if (self.remedyTypeSC.selectedSegmentIndex == 1) {
        self.remedy.remedyType = @"Herb";
    }
    else if (self.remedyTypeSC.selectedSegmentIndex == 2) {
        self.remedy.remedyType = @"Supplement";
    }
    else if (self.remedyTypeSC.selectedSegmentIndex == 3) {
        self.remedy.remedyType = @"Body";
    }

    self.remedy.remedyName = self.remedyName.text;
    self.remedy.remedyDescription = self.remedyDescription.text;
    self.remedy.remedyURL = self.remedyURL.text;

    // in ADD mode
    if (self.inEditMode == NO) {
        [self.remedyList addObject:self.remedy];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Misc Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
