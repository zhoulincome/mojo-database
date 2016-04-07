//
//  AppDatabase.h
//  groove-iphone
//
//  Created by Craig Jolicoeur on 5/5/11.
//  Copyright 2011 Mojo Tech, LLC. All rights reserved.
//

#import "MojoDatabase.h"
#import "MojoModel.h"

@interface AppDatabase : MojoDatabase {
}
-(void)runMigrations;
-(NSUInteger)databaseVersion;
-(void)setDatabaseVersion:(NSUInteger)newVersionNumber;

//默认数据库名字
-(id)initWithMigrations;
-(id)initWithMigrations:(BOOL)loggingEnabled;

//用户自定义数据库名字
-(id)initWithMigrationsName:(NSString *)dataBaseName;
-(id)initWithMigrationsName:(NSString *)dataBaseName  loggingEnabled:(BOOL)loggingEnabled;
@end
