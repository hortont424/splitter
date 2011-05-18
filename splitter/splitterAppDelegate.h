#import <Cocoa/Cocoa.h>

#import "SPWindow.h"
#import "SPView.h"
#import "SPTree.h"

@interface splitterAppDelegate : NSObject <NSApplicationDelegate>
{
    SPWindow * window;
    SPView * splitterView;
}

@property (assign) IBOutlet SPWindow * window;

@end
