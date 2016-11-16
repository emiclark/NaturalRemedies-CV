//
//  AddAilmentViewController.m
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/7/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "AddAilmentViewController.h"

@interface AddAilmentViewController ()

@end

@implementation AddAilmentViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    
    UIBarButtonItem *saveAilment = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSave target:self action:@selector(saveAilment:)];
    
    self.navigationItem.rightBarButtonItem = saveAilment;
}

- (void ) viewWillAppear:(BOOL)animated {
    
    if (self.detailIsInEditMode == YES) {
        // in edit mode
        self.ailmentName.text = self.ailment.ailmentName;
        self.deleteButton.hidden = NO;
    }
    // in add mode
    else {
        self.deleteButton.hidden = YES;
    }
}


#pragma mark - Button Tapped

- (IBAction)deleteButtonTapped:(UIButton *)sender {
    [self.dao.ailmentList removeObject: self.ailment];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveAilment: (id*)sender {
    // update ailment
    if (self.detailIsInEditMode == YES) {
        self.ailment.ailmentName = self.ailmentName.text;
        [self.navigationController  popViewControllerAnimated:YES];
    }
    // add new ailment
    else {
        Ailment *ailmentToAdd = [[Ailment alloc] initWithName:self.ailmentName.text andImage:@"defaultAddAilmentImage.jpg"];
        [self.dao.ailmentList addObject:ailmentToAdd];
        self.detailIsInEditMode = NO;
    }
    [self.navigationController  popViewControllerAnimated:YES];
}

#pragma mark - Misc Methods

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
