//
//  KATDatabaseManager.m
//  KenoshaAreaTransit
//
//  Created by Richard Lebbin on 3/10/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import "KATDatabaseManager.h"
static KATDatabaseManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation KATDatabaseManager

+(KATDatabaseManager*)getSharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB {
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"katschedule.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "create table if not exists routetable (_id int(6) DEFAULT NULL PRIMARY KEY auto_increment, route int(3) DEFAULT NULL, location text, day text, time int(4) DEFAULT NULL ";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}

- (BOOL) addRow:(NSString*)_route location:(NSString*)_loc day:(NSString*)_day time:(NSString*)_time {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into routetable (route, location, day, time) values (\"%@\",\"%@\",\"%@\",\"%@\")",_route, _loc, _day, _time];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement == SQLITE_DONE) ) {
            return YES;
        } else {
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}

//- (NSArray*) findByRegisterNumber:(NSString*)registerNumber {
//    const char *dbpath = [databasePath UTF8String];
//    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
//        NSString *querySQL = [NSString stringWithFormat:@"select name, department, year from studentsDetail where regno=\"%@\"",registerNumber];
//        const char *query_stmt = [querySQL UTF8String];
//        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
//        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
//            if (sqlite3_step(statement) == SQLITE_ROW) {
//                NSString *name = [[NSString alloc] initWithUTF8String:
//                                        (const char *) sqlite3_column_text(statement, 0)];
//                [resultArray addObject:name];
//                NSString *department = [[NSString alloc] initWithUTF8String:
//                                        (const char *) sqlite3_column_text(statement, 1)];
//                [resultArray addObject:department];
//                NSString *year = [[NSString alloc]initWithUTF8String:
//                                        (const char *) sqlite3_column_text(statement, 2)];
//                [resultArray addObject:year];
//                return resultArray;
//            } else {
//                NSLog(@"Not found");
//                return nil;
//            }
//            sqlite3_reset(statement);
//        }
//    }
//    return nil;
//}

- (NSArray*) getTimeAndRoute:(NSString*)QRData time:(NSString*)_time {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"\"%@\"",QRData];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSString *route = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addobject:route];
                NSString *times
            } else {
                NSLog(@"Not found");
                return nil;
            }
            sqlite3_reset(statement);
        }
    }
    return nil;
}



@end