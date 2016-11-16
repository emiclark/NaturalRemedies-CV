//
//  RemedyCollectionViewController.m
//  NaturalRemedies
//
//  Created by Emiko Clark on 11/9/16.
//  Copyright © 2016 Richard Wells. All rights reserved.
//

#import "RemedyCollectionViewController.h"

@interface RemedyCollectionViewController ()

@end

@implementation RemedyCollectionViewController

// color for inEditMode = YES
#define IN_EDIT_MODE [UIColor colorWithRed:150.0/255.0 green:0.0/255.0 blue:250.0/255.0 alpha:1];

// color for inEditMode = NO
#define SYSBLUE [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];

static NSString * const reuseIdentifier = @"myCell";
static  UIBarButtonItem *editButton;

// used for expanding and collapsing collection views
#define COLLAPSED_CELL_HEIGHT 87
#define EXPANDED_CELL_HEIGHT 175
NSInteger selectedRow = -1;
static int cellWidth  = 300;
static int cellHeight = COLLAPSED_CELL_HEIGHT;
static CollectionViewCellB *tempCell;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    
    // set boolean to install gestures
    self.installsStandardGestureForInteractiveMovement = YES;
    
    // Uncomment the following line to preserve selection between presentations
     self.clearsSelectionOnViewWillAppear = NO;
    
    //Set Main Cell in Collection View
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCellB" bundle:nil] forCellWithReuseIdentifier: reuseIdentifier];
    
    self.collectionView.autoresizesSubviews = YES;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    //add Edit, Add button to navigation bar
    editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonTapped:)];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
    
    self.navigationItem.rightBarButtonItems = @[addButton, editButton];
}


- (void) viewWillAppear:(BOOL)animated  {
    self.inEditMode = NO;
    [self setEditing:NO];
    editButton.tintColor = SYSBLUE;
    selectedRow = -1;
    [self.collectionView reloadData];
}

#pragma mark - Buttons Tapped

- (IBAction)moreButtonTapped:(UIButton *)sender {
    
    // converts position clicked into which collectionView[indexPath.row]
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint :buttonPosition];
    
    // remedy has NO URL, then push to Description View
    if ([[[self.remedyList objectAtIndex:indexPath.row] remedyURL] isEqual:@""]) {
        self.remedyDescriptionVC = [[RemedyDescriptionViewController alloc] init];
        self.remedyDescriptionVC.title = [[self.remedyList objectAtIndex: indexPath.row] remedyName];
        self.remedyDescriptionVC.remedy = [self.remedyList objectAtIndex: indexPath.row];
        [self.navigationController pushViewController:self.remedyDescriptionVC animated:YES];
    }
    
    // remedy has a URL, then launch webview
    else {
        
        self.remedyWebVC = [[RemedyWebViewController alloc] initWithNibName: @"RemedyWebViewController" bundle:nil];
        self.remedyWebVC.title = [[self.remedyList objectAtIndex:indexPath.row] remedyName];
        
        // set url
        self.remedyWebVC.url =  [NSURL URLWithString:[[self.remedyList objectAtIndex:indexPath.row] remedyURL]];
        
        [self.navigationController pushViewController:self.remedyWebVC animated:YES];
    }
}


- (void) addButtonTapped: (id*) sender {
    
    self.addRemedyVC = [[AddRemedyViewController alloc] initWithNibName:@"AddRemedyViewController" bundle:nil];
    
    //add new remedy
    self.addRemedyVC.title = @"Add New Remedy";
    self.addRemedyVC.remedyList = self.remedyList;
    [self.navigationController pushViewController:self.addRemedyVC animated:YES];
}


- (void) editButtonTapped: (id*) sender {
    
    // turn ON edit mode
    if (self.editing == NO) {
        // set editing to YES
        self.inEditMode = YES;
        self.editing = YES;
        editButton.tintColor = IN_EDIT_MODE;
    }
    // turn OFF edit mode
    else {
        self.inEditMode = NO;
        self.editing = NO;
        editButton.tintColor = SYSBLUE;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.remedyList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    CollectionViewCellB *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Remedy *remedy = [self.remedyList objectAtIndex:indexPath.row];
    
    // Configure the cell
    if ([remedy.remedyType isEqual: @"Meditation"]) {
        cell.remedyImage.image = [UIImage imageNamed: @"meditation.png"];
        cell.remedyType.text = remedy.remedyType;
    }
    else if ([remedy.remedyType isEqual: @"Body"]) {
        cell.remedyImage.image = [UIImage imageNamed:@"yoga.png"];
        cell.remedyType.text = @"Body and Movement";
    }
    else if ([remedy.remedyType isEqual: @"Supplement"]) {
        cell.remedyImage.image = [ UIImage imageNamed:@"capsule.png"];
        cell.remedyType.text = remedy.remedyType;
    }
    else if ([remedy.remedyType isEqual: @"Herb"]) {
        cell.remedyImage.image = [UIImage imageNamed:@"herb.png"];
        cell.remedyType.text = remedy.remedyType;
    }
    
    cell.remedyName.text = remedy.remedyName;
    cell.remedyDescription.numberOfLines = 0;
    cell.remedyDescription.text = remedy.remedyDescription;
    
    // adjust text to be top left justified
    cell.remedyDescription.textAlignment = NSTextAlignmentLeft ;
    
    // tempCell remembers which cell was selected, used to make moreButton appear in the sizeForItemAtIndexPath delegate
    
    // collapsed view, show moreButton
    if (selectedRow == indexPath.row) {
        tempCell.moreButton.hidden = NO;
    }
    // expanded view, show moreButton
    else {
        tempCell.moreButton.hidden = YES;
    }
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath: (NSIndexPath *)indexPath  {
    
    // one tap on a cell expands the cell, and also collapses other expanded cells
    if(indexPath.row == selectedRow){
        
        // if cellHeight is collapsed, then expand & show moreButton
        if(cellHeight == COLLAPSED_CELL_HEIGHT) {
            cellHeight = EXPANDED_CELL_HEIGHT;
            tempCell.moreButton.hidden = NO;
        }
        return CGSizeMake(cellWidth, cellHeight);
    }
    // tapped on a different or expanded cell, then collapse cell and hide moreButton
    else {
        
        // if cellHeight is expanded, then collapse & hide moreButton
        if(cellHeight == EXPANDED_CELL_HEIGHT) {
            cellHeight = COLLAPSED_CELL_HEIGHT;
            tempCell.moreButton.hidden = YES;
        }
        return CGSizeMake(cellWidth, COLLAPSED_CELL_HEIGHT);
    }
}


#pragma mark <UICollectionViewDelegate>

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedRow = indexPath.row;
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
    // if in edit mode and cell expanded, then go to edit mode
    self.addRemedyVC = [[AddRemedyViewController alloc] initWithNibName:@"AddRemedyViewController" bundle:nil];
    self.addRemedyVC.inEditMode = self.inEditMode;
    
    // in update mode
    if (self.inEditMode == YES) {
        self.addRemedyVC.title = [NSString stringWithFormat: @"Update %@",[self.remedyList objectAtIndex:indexPath.row].remedyName];
        
        self.addRemedyVC.remedy = [self.remedyList objectAtIndex:indexPath.row];
        self.addRemedyVC.remedyList = self.remedyList;
        
        [self.navigationController pushViewController:self.addRemedyVC animated:YES];
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    Remedy *objectToMove = [self.remedyList objectAtIndex:sourceIndexPath.row];
    [self.remedyList removeObjectAtIndex:sourceIndexPath.row];
    [self.remedyList insertObject: objectToMove atIndex:destinationIndexPath.row];
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

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

#pragma mark Misc Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
