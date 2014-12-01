//
//  GraffleSheet.m
//  GraffleToXCode
//
//  Created by Hernan on 7/22/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "GraffleSheet.h"

@interface GraffleSheet()

@property (nonatomic, retain) NSString *name;
@property (nonatomic) NSInteger sheetId;
@property (nonatomic) CGSize size;

@end

@implementation GraffleSheet

#pragma mark API
- (GraffleSheet *)initWithProperties:(NSDictionary *)properties
{
  self = [super init];

  if (self)
  {
    [self buildWithProperties:properties];
  }

  return self;
}

#pragma mark Utils
- (void)buildWithProperties:(NSDictionary *)properties
{
  _name = [properties objectForKey:@"SheetTitle"];
  _sheetId = [[properties objectForKey:@"UniqueID"] intValue];

  NSString *sizeKey = @"CanvasSize";
  NSPoint sizePoint = NSPointFromString([properties objectForKey:sizeKey]);
  _size = CGSizeMake(sizePoint.x, sizePoint.y);
}

@end
