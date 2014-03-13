//
//  KATBusRouteListViewController.h
//  KenoshaAreaTransit
//
//  Created by Valerie Berglind on 2/22/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KATBusListTableCell.h"

@interface KATBusRouteListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *busListArray;
@property (strong, nonatomic) IBOutlet UITableView *busListTableView;
//@property (strong, nonatomic) IBOutlet UILabel *routeNumberLabel;
//@property (strong, nonatomic) IBOutlet UILabel *routeTimeLabel;
//@property (strong, nonatomic) IBOutlet UILabel *routeDirectionLabel;

@end
