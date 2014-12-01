//
//  GraffleProject.m
//  GraffleToXCode
//
//  Created by Hernan on 11/27/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "GraffleProject.h"

@interface GraffleProject ()

@property (nonatomic, retain, readonly) NSString *name;

@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSMutableArray *sheets;

@end

@implementation GraffleProject

- (GraffleProject *)initWithName:(NSString *)theName
{
  self = [super init];
  if (self)
  {
    _name = theName;

    _images = [NSMutableArray array];
    _sheets = [NSMutableArray array];
  }
  return self;
}

- (void)addImage:(NSString *)path
{
  [_images addObject:path];
}

- (void)addSheet:(GraffleSheet *)sheet
{
  [_sheets addObject:sheet];
}

- (NSString *)createXCodeProjectAt:(NSURL *)dropDestination
{
  // Create the root folder
  NSURL *rootDir = [self newFolderNamed:_name at:dropDestination];

  // Create the structure
  NSURL *dataDir = [self newFolderNamed:_name at:rootDir];
  NSURL *assetsDir = [self newFolderNamed:@"Assets" at:dataDir];
  NSURL *baseDir = [self newFolderNamed:@"Base.lproj" at:dataDir];
  NSURL *imagesDir = [self newFolderNamed:@"Images.xcassets" at:dataDir];
  NSURL *xcodeProjDir = [self newFolderNamed:[self projName] at:rootDir];

  // Copy all the images from the graffle bundle
  for (NSString* a in _images)
  {
    [self copy:a to:assetsDir];
  }

  // Copy the code


  // Add the storyboard

  // Add the pbxproj

  return _name;
}

#pragma mark Utils
- (NSURL *)newFolderNamed:(NSString *)theName at:(NSURL *)theDestination
{
  NSURL *target = [NSURL URLWithString:theName relativeToURL:theDestination];
  [[NSFileManager defaultManager] createDirectoryAtURL:target
                           withIntermediateDirectories:YES
                                            attributes:nil
                                                 error:nil];
  return target;
}

- (void)copy:(NSString *)sourcePath to:(NSURL *)directory
{

}

- (NSString *)projName
{
  return [_name stringByAppendingString:@".xcodeproj"];
}

@end
