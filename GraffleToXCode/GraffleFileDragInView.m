//
//  DragInImageView.m
//  GraffleToXCode
//
//  Created by Hernan on 7/20/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "GraffleFileDragInView.h"

@interface GraffleFileDragInView()

@property (nonatomic, weak) id<GraffleFileDragInDelegate> delegate;

@end

@implementation GraffleFileDragInView

- (GraffleFileDragInView *)initWithImage:(NSImage *)theImage
                             andDelegate:(id<GraffleFileDragInDelegate>)theDelegate;
{
  NSRect rect = CGRectMake(0, 0, theImage.size.width, theImage.size.height);
  self = [super initWithFrame:rect];
  if (self)
  {
    [self registerForDraggedTypes:[self dragTypes]];
    _delegate = theDelegate;
    [self setImage:theImage];
  }
  return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
  [super drawRect:dirtyRect];
}

- (NSArray *)dragTypes
{
  return [NSArray arrayWithObject:NSFilenamesPboardType];
}

#pragma mark NSDraggingDestination
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
  NSString *path = [self getPathFromDraggingInfo:sender];
  if (path != nil && [path.pathExtension isEqualToString:@"graffle"])
  {
    [self showBorder];
    return NSDragOperationCopy;
  }
  else
  {
    return NSDragOperationNone;
  }
}

- (void)draggingExited:(id<NSDraggingInfo>)sender
{
  [self hideBorder];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
  [self hideBorder];
  [self animateOnDraggedIn];

  NSString *path = [self getPathFromDraggingInfo:sender];
  [_delegate gotGraffleFileAtPath:path];

  return YES;
}

- (NSString *)getPathFromDraggingInfo:(id<NSDraggingInfo>)info
{
  NSPasteboard *pboard = [info draggingPasteboard];
  NSArray *filenames = [pboard propertyListForType:NSFilenamesPboardType];

  if (filenames.count != 1)
    return nil;
  else
    return [filenames lastObject];
}

#pragma mark UI
- (void)showBorder
{
  [self setWantsLayer:YES];

  CGColorRef color = CGColorCreateGenericRGB(0.5f, 0.5f, 0.5f, 0.5f);
  [_layer setBorderColor:color];
  [_layer setBorderWidth:2.0f];
  [_layer setCornerRadius:8.0f];
}

- (void)hideBorder
{
  CGColorRef color = CGColorCreateGenericRGB(0.5f, 0.5f, 0.5f, 0.0f);
  [_layer setBorderColor:color];
  [_layer setNeedsDisplay];
}

- (void)animateOnDraggedIn
{
  // TODO
}

@end
