//
//  xtzViewController.m
//  testing
//
//  Created by Ehkalu Moo on 11/18/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "xtzViewController.h"
#import "DetailViewController.h"

@interface xtzViewController ()
{ NSMutableArray *titleArray;
    NSMutableArray *subtitleArray;
}

@end

@implementation xtzViewController

@synthesize mytableview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    
    titleArray = [[NSMutableArray alloc] initWithObjects:@"Apple", @"Bird", @"Cat", @"Dog",nil];
    subtitleArray =[[NSMutableArray alloc] initWithObjects:@"Pawtha", @"Toe", @"Thameow", @"Twe", nil];
}

-(NSInteger) numberOfSectionInTableView:(UITableView *)tableview
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [subtitleArray objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if ([segue.identifier isEqualToString:@"detailsegue"])
    {
        NSIndexPath *indexpath = nil;
        NSString    *titlestring = nil;
        NSString    *subtitlestring =nil;
        
        indexpath = [mytableview indexPathForSelectedRow];
        titlestring = [titleArray objectAtIndex:indexpath.row];
        subtitlestring = [subtitleArray objectAtIndex: indexpath.row];
        
        [[segue destinationViewController] setTitlecontents:titlestring];
        [[segue destinationViewController] setSubtitlecontents:subtitlestring];
        
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
