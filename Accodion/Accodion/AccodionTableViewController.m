//
//  AccodionTableViewController.m
//  Accodion
//
//  Created by Shailesh on 31/05/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

#import "AccodionTableViewController.h"
#import "SectionTableviewCell.h"
#import "SectionTableViewCeli1.h"

@implementation AccodionTableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier1 = @"Cell1";
    static NSString *CellIdentifier2 = @"Cell2";
    
    
    if (indexPath.row==0) {
        SectionTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        if (cell == nil) {
            cell = [[SectionTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1] ;
        }
        if ( self.selectedIndexPath != nil && [self.selectedIndexPath compare: indexPath] == NSOrderedSame ){
            cell.arrowImage.image = [UIImage imageNamed:@"triangledownicon"];
        }
        else{
            cell.arrowImage.image = [UIImage imageNamed:@"triangleicon"];
            
        }
        return cell;

    }
    else{
        SectionTableViewCeli1 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
        if (cell == nil) {
            cell = [[SectionTableViewCeli1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2] ;
        }
        if ( self.selectedIndexPath != nil && [self.selectedIndexPath compare: indexPath] == NSOrderedSame ){
            cell.arrowImage.image = [UIImage imageNamed:@"triangledownicon"];
        }
        else{
            cell.arrowImage.image = [UIImage imageNamed:@"triangleicon"];
            
        }
        return cell;

    }
}



#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( self.selectedIndexPath != nil && [self.selectedIndexPath compare: indexPath] == NSOrderedSame )
    {
        return 200;
    }
    
    return tableView.rowHeight;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* toReload = [NSArray arrayWithObjects: indexPath, self.selectedIndexPath, nil];
    self.selectedIndexPath = indexPath;
    
    [tableView reloadRowsAtIndexPaths: toReload withRowAnimation: UITableViewRowAnimationMiddle];
}

@end
