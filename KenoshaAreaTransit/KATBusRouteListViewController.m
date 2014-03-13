//
//  KATBusRouteListViewController.m
//  KenoshaAreaTransit
//
//  Created by Valerie Berglind on 2/22/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import "KATBusRouteListViewController.h"

@interface KATBusRouteListViewController ()

@end

@implementation KATBusRouteListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.busListTableView.delegate = self;
    self.busListTableView.dataSource = self;
    
    //test code replace with database
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Route: 1", @"routeNumber",
                           @"Time: 2:15 pm", @"routeTime", @"Direction: North", @"routeDirection", nil];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Route: 2", @"routeNumber",
                           @"Time: 4:00 pm", @"routeTime", @"Direction: South", @"routeDirection", nil];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Route: 3", @"routeNumber",
                           @"Time: 5:20 pm", @"routeTime", @"Direction: North", @"routeDirection", nil];
    NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:@"Route: 4", @"routeNumber",
                           @"Time: 6:00 pm", @"routeTime", @"Direction: South", @"routeDirection", nil];
    
    self.busListArray = [NSMutableArray arrayWithObjects:dict1, dict2, dict3, dict4, nil];
    //end of test code input
    
}

//return the number of entries in the array
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.busListArray.count;
}

//height of a row
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"TableCellId";
    KATBusListTableCell *tableCell = (KATBusListTableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSDictionary * dict = [self.busListArray objectAtIndex:indexPath.row];
    tableCell.routeNumberLabel.text = [dict objectForKey:@"routeNumber"];
    tableCell.routeTimeLabel.text = [dict objectForKey:@"routeTime"];
    tableCell.routeDirectionLabel.text = [dict objectForKey:@"routeDirection"];
    
    return tableCell;
}

-(BOOL)shouldAutorotate{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
