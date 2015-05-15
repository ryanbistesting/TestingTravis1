#import <Specta/Specta.h> // #import "Specta.h" if you're using libSpecta.a
#import <Expecta/Expecta.h>

SpecBegin(Thing)

describe(@"Thing", ^{
    it(@"should do stuff", ^{
        expect(YES).to.beTruthy();
    });
});

SpecEnd