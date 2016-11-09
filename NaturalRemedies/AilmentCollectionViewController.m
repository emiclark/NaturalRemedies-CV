//
//  AilmentCollectionViewController.m
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "AilmentCollectionViewController.h"

@interface AilmentCollectionViewController ()

#define SCARLET [UIColor colorWithRed:207.0/255.0 green:47.0/255.0 blue:40.0/255.0 alpha:1];
#define SYSBLUE [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
@end

@implementation AilmentCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    self.ailmentCells = [[NSMutableArray alloc]init];
    
    // Uncomment the following line to preserve selection between presentations
     self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Do any additional setup after loading the view.
    [self.ailmentCV registerNib:[UINib nibWithNibName:@"CollectionViewCellA" bundle:nil] forCellWithReuseIdentifier: @"myCell"];
    
    // add edit Button
    self.editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target: self action: @selector(editButtonTapped:)];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
    
    self.navigationItem.rightBarButtonItems = @[ addButton, self.editButton];
    
    // set booleans for in editing mode
    self.inEditMode = NO;
    
}


- (void) viewWillAppear:(BOOL)animated  {
    
    self.inEditMode = self.addAilmentVC.detailIsInEditMode;
    self.editButton.tintColor = SYSBLUE;
    [self setEditing:NO];
    [self.ailmentCV reloadData];
}

- (void) addButtonTapped: (id*)sender {
    self.inEditMode = NO;
    self.addAilmentVC.detailIsInEditMode = self.inEditMode;

    self.addAilmentVC = [[AddAilmentViewController alloc] initWithNibName:@"AddAilmentViewController" bundle:nil];
    self.addAilmentVC.title = [NSString stringWithFormat: @"Add New Ailment"];
    [self.navigationController pushViewController:self.addAilmentVC animated:YES];
}


- (void) editButtonTapped: (id*) sender {
    
    // turn off edit mode
    if (self.editing == YES) {
        self.inEditMode = NO;
        [self setEditing:NO];
        self.editButton.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    }
    // turn on edit mode
    else {
        [self setEditing:YES];
        self.inEditMode = YES;
        self.editButton.tintColor = [UIColor blueColor];
    }
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

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.dao.ailmentList.count;
    return self.dao.ailmentList.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.myCell = [collectionView dequeueReusableCellWithReuseIdentifier: @"myCell" forIndexPath:indexPath];
    
    Ailment *tempStr = [self.dao.ailmentList objectAtIndex:indexPath.row];
    
    // Configure the cell
    self.myCell.ailmentImage.image = [UIImage imageNamed:tempStr.ailmentImage];
    self.myCell.cellLabel.text = tempStr.ailmentName;
    
    self.myCell.deleteButton.hidden = YES;
    [self.ailmentCells addObject:self.myCell];

    return self.myCell;
}


#pragma mark UICollectionViewDelegates

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    self.addAilmentVC = [[AddAilmentViewController alloc]init];
//    self.addAilmentVC.detailIsInEditMode = self.inEditMode;
    
    // is in edit mode
    if (self.inEditMode == YES) {
        self.editButton.tintColor = [UIColor darkGrayColor];
        self.addAilmentVC = [[AddAilmentViewController alloc] initWithNibName:@"AddAilmentViewController" bundle:nil];
        self.addAilmentVC.title = [NSString stringWithFormat: @"Update %@", [self.dao.ailmentList objectAtIndex:indexPath.row]];
        
        self.addAilmentVC.detailIsInEditMode = self.inEditMode;
        
        self.addAilmentVC.ailment = [self.dao.ailmentList objectAtIndex:indexPath.row];
        self.addAilmentVC.detailIsInEditMode = self.inEditMode;
//        NSLog(@"%@",self.addAilmentVC.ailment);
        [self.navigationController pushViewController:self.addAilmentVC animated:YES];
    }
//    self.addAilmentVC.detailIsInEditMode = self.inEditMode;

}

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}



// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/



- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath * )sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    Ailment *itemToMove = (Ailment*)[self.dao.ailmentList objectAtIndex:sourceIndexPath.row];

    // move items in the dao.ailment array
    [self.dao.ailmentList removeObjectAtIndex:sourceIndexPath.row];
    [self.dao.ailmentList insertObject:itemToMove atIndex:destinationIndexPath.row];
    
    // reload data
    [self.ailmentCV reloadData];
     
}

@end
