//
//  GraffleProject.h
//  GraffleToXCode
//
//  Created by Hernan on 11/27/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraffleSheet.h"

@interface GraffleProject : NSObject

// API
- (GraffleProject *)initWithName:(NSString *)theName;

- (void)addImage:(NSString *)path;
- (void)addSheet:(GraffleSheet *)sheet;

- (NSString *)createXCodeProjectAt:(NSURL *)dropDestination;

@end
