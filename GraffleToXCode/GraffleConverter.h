//
//  GraffleConverter.h
//  GraffleToXCode
//
//  Created by Hernan on 7/20/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraffleProject.h"

@interface GraffleConverter : NSObject

- (GraffleConverter *)init;

- (GraffleProject *)buildFromFileAt:(NSString *)path;

@end