//
//  GraffleConverter.m
//  GraffleToXCode
//
//  Created by Hernan on 7/20/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "GraffleConverter.h"

@interface GraffleConverter()

// NSString array, contains the paths of all the images used
@property (nonatomic, retain) NSArray *images;
// GraffleSheet array, contains the properties

@end

@implementation GraffleConverter

#pragma mark API
- (GraffleConverter *)init
{
  self = [super init];
  if (self)
  {
  }
  return self;
}

- (GraffleProject *)buildFromFileAt:(NSString *)path
{
  // Create the project
  NSString *name = [[[path pathComponents] lastObject] stringByDeletingPathExtension];
  GraffleProject *project = [[GraffleProject alloc] initWithName:name];

  // Read the graffle file
  NSString *dataPath = [self dataFilenameFromPath:path];
  NSDictionary *rawData = [NSDictionary dictionaryWithContentsOfFile:dataPath];

  // Get list of image files in the bundle
  _images = [NSMutableArray array];
  NSArray *rawImageList = [rawData objectForKey:@"ImageList"];
  for (NSString *a in rawImageList)
  {
    NSString *imagePath = [path stringByAppendingPathComponent:a];
    [(NSMutableArray *)_images addObject:imagePath];
  }
  _images = [NSArray arrayWithArray:_images];

  // Get the sheet list



  return project;
}

#pragma mark Utils
- (NSString *)dataFilenameFromPath:(NSString *)path
{
  return [path stringByAppendingPathComponent:@"data.plist"];
}

@end
