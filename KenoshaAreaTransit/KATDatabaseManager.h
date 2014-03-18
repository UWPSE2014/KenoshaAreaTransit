//
//  KATDatabaseManager.h
//  KenoshaAreaTransit
//
//  Created by Richard Lebbin on 3/10/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface KATDatabaseManager : NSObject
{
    NSString *databasePath;
}

+(KATDatabaseManager*)getSharedInstance;
-(BOOL)createDB;
-(BOOL)saveData:(NSString*)registerNumber name:(NSString*)name
      department:(NSString*)department year:(NSString*)year;
@end
