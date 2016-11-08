//
//  AilmentCollectionViewController.m
//  NaturalRemedies
//
//  Created by Aditya Narayan on 11/4/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "AilmentCollectionViewController.h"

@interface AilmentCollectionViewController ()


@end

@implementation AilmentCollectionViewController

UIBarButtonItem *editButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    self.ailmentCells = [[NSMutableArray alloc]init];
    
    // Uncomment the following line to preserve selection between presentations
     self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Do any additional setup after loading the view.
    [self.ailmentCV registerNib:[UINib nibWithNibName:@"CollectionViewCellA" bundle:nil] forCellWithReuseIdentifier: @"myCell"];
    
    // add edit Button
    editButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action: @selector(DeleteButtonTapped:)];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
    self.navigationItem.rightBarButtonItems = @[addButton, editButton];
    
    // hide delete button icon
    [self setEditing:NO];
}

- (void) addButtonTapped: (id*)sender {
    self.addAilmentVC = [[AddAilmentViewController alloc] initWithNibName:@"AddAilmentViewController" bundle:nil];
    [self.navigationController pushViewController:self.addAilmentVC animated:YES];
}

- (void) viewWillAppear:(BOOL)animated  {
    [self.ailmentCV reloadData];
}

- (void) DeleteButtonTapped: (id*) sender {

    // In edit mode: change Edit button -> Done
    if (self.editing == YES) {
        [self setEditing:NO];
        editButton.title = @"Delete";
        for (CollectionViewCellA *cell in self.ailmentCells) {
            cell.deleteButton.hidden = YES;
        }
    }
    // Finished edit mode: Change Done button -> Edit
    else {
        for (CollectionViewCellA *cell in self.ailmentCells) {
            cell.deleteButton.hidden = NO;
        }
        editButton.title = @"Done";
        [self setEditing:YES];

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
    
    // is in delete mode
    if (self.isEditing) {
        [self.dao.ailmentList removeObjectAtIndex:indexPath.row];
        [self.ailmentCV reloadData];
        [self setEditing: NO];
        editButton.title = @"Delete";
    }
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
