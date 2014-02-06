//
//  DCMainTableViewController.m
//  DCHideableSectionViewController
//
//  Created by Dan Cohn on 2/5/14.
//  Copyright (c) 2014 Dan Cohn. All rights reserved.
//

#import "DCMainTableViewController.h"

@interface DCMainTableViewController ()

@property (nonatomic, strong) NSMutableArray *section0Objects;
@property (nonatomic, strong) NSMutableArray *section1Objects;
@property (nonatomic, strong) NSMutableArray *section2Objects;

@property (nonatomic, assign) NSUInteger index;

@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@end

@implementation DCMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.section0Objects = [[NSMutableArray alloc] init];
    self.section1Objects = [[NSMutableArray alloc] init];
    self.section2Objects = [[NSMutableArray alloc] init];
    
    self.index = 0;
    self.headerViewHeight = 33.0f;
    self.footerViewHeight = 0.0f;
}

- (IBAction)addButtonPressed:(UIBarButtonItem *)sender
{
    self.hintLabel.hidden = YES;
    
    NSString *newObject = [[NSString alloc] initWithFormat:@"Object %d", self.index];
    NSInteger section = 0;
    NSInteger row = 0;

    if ( self.index % 3== 0 )
    {
        section = 0;
        row = self.section0Objects.count;
        [self.section0Objects addObject:newObject];
    }
    else if ( self.index % 3 == 1 )
    {
        section = 1;
        row = self.section1Objects.count;
        [self.section1Objects addObject:newObject];
    }
    else if ( self.index % 3 == 2 )
    {
        section = 2;
        row = self.section2Objects.count;
        [self.section2Objects addObject:newObject];
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self.tableView insertRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    self.index++;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( section == 0 )
        return self.section0Objects.count;
    if ( section == 1 )
        return self.section1Objects.count;
    if ( section == 2 )
        return self.section2Objects.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if ( indexPath.section == 0 )
        cell.textLabel.text = self.section0Objects[indexPath.row];
    if ( indexPath.section == 1 )
        cell.textLabel.text = self.section1Objects[indexPath.row];
    if ( indexPath.section == 2 )
        cell.textLabel.text = self.section2Objects[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if ( indexPath.section == 0 )
            [self.section0Objects removeObjectAtIndex:indexPath.row];
        if ( indexPath.section == 1 )
            [self.section1Objects removeObjectAtIndex:indexPath.row];
        if ( indexPath.section == 2 )
            [self.section2Objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %d", section];
}


@end
