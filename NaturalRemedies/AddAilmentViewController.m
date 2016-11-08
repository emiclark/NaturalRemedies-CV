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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *addAilment = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSave target:self action:@selector(saveAilment:)];
    
    self.navigationItem.rightBarButtonItem = addAilment;
}

- (void)saveAilment: (id*)sender {
    Ailment *ailmentToAdd = [[Ailment alloc] initWithName:self.ailmentName.text andDescription:@"" andImage:@"defaultAddAilmentImage.jpg"];
    [self.dao.ailmentList addObject:ailmentToAdd];
    
    [self.navigationController  popViewControllerAnimated:YES];
}


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
