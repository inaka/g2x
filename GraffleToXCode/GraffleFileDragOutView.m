//
//  DragOutImageView.m
//  GraffleToXCode
//
//  Created by Hernan on 7/20/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "GraffleFileDragOutView.h"
#import "GraffleProject.h"

@interface GraffleFileDragOutView ()

@property (nonatomic, weak) GraffleProject *project;

@end

@implementation GraffleFileDragOutView

#pragma mark API
- (GraffleFileDragOutView *)initWithImage:(NSImage *)theImage;
{
  NSRect rect = CGRectMake(0, 0, theImage.size.width, theImage.size.height);
  self = [super initWithFrame:rect];
  if (self)
  {
    _project = nil;
    [self setImage:theImage];
  }
  return self;
}

- (void)enableForPrject:(GraffleProject *)theProject
{
  _project = theProject;
  self.alphaValue = 1.0f;
}

- (void)disable
{
  _project = nil;
  self.alphaValue = 0.5f;
}

#pragma mark Events
- (void)mouseDown:(NSEvent *)theEvent
{
  if (_project)
  {
    NSLog(@"ENABLED");

    NSPoint dragPosition;
    NSRect imageLocation;

    dragPosition = [self convertPoint:[theEvent locationInWindow]
                             fromView:nil];
    dragPosition.x -= 16;
    dragPosition.y -= 16;
    imageLocation.origin = dragPosition;
    imageLocation.size = NSMakeSize(32,32);
    [self dragPromisedFilesOfTypes:[NSArray arrayWithObject:@"xcodeproj"]
                          fromRect:imageLocation
                            source:self
                         slideBack:YES
                             event:theEvent];
  }
  else
  {
    NSLog(@"NOT ENABLED");
  }
}

- (NSArray *)namesOfPromisedFilesDroppedAtDestination:(NSURL *)dropDestination
{
  NSString *name = [_project createXCodeProjectAt:dropDestination];
  return [NSArray arrayWithObject:name];
}

#pragma mark UI


@end
