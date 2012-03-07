//
//  Deck.h
//  FreeBird
//
//  Created by Noel Feliciano on 11-10-06.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameVariables.h"
#import "Card.h"

typedef enum {
    Icteridae,      //Blackbirds and Orioles
    Cardinalidae,   //Cardinals and Grosbeaks
    Corvidae,       //Crows, Jays, and Magpies
    Fringillidae,   //Finches
    Mimidae,        //Mockingbirds and Thrashers
    Emberizidae,    //Sparrows
    Hirundinidae,   //Swallows and Martins
    Thraupidae,     //Tanagers
    Turdidae,       //Thrushes
    Paridae,        //Tits and Chickadees
    Tyrannidae,     //Tyrant Flycatchers
    Vireonidae,     //Vireos
    Motacillidae,   //Wagtails and Pipits
    Parulidae,      //Wood Warblers
    Troglodytidae   //Wrens
} Family;

//Will need to list ALL the species. Is there a better way?
//Idea: plist, with a string property for family type returned, will seek dictionary objectForKey:species
//Consider after card display
/*typedef enum {
    //Icteridae: Blackbirds and Orioles
    AltamiraOriole, //in
    AudubonsOriole,
    BaltimoreOriole, //in
    BlackVentedOriole,
    BullocksOriole,
    HoodedOriole,
    OrchardOriole,
    RedWingedBlackbird,
    ScottsOriole,
    SpotBrestedOriole,
    StreakBackedOriole,
    YellowHeadedBlackbird,
    
    //Cardinalidae: Cardinals and Grosbeaks
    BlackHeadedGrosbeak,
    BlueBunting,
    BlueGrosbeak,
    Dickcissel,
    IndigoBunting,
    LazuliBunting,
    NorthernCardinal,
    PaintedBunting,
    Pyrrhuloxia,
    RoseBreastedGrosbeak,
    VariedBunting,
    YellowGrosbeak,
    
    //Corvidae: Crows, Jays, and Magpies
    BlueJay, //in
    BrownJay,
    ClarksNucracker,
    FishCrow,
    FloridaScrubJay,
    GrayJay, //in
    GreenJay,
    IslandScrubJay,
    MexicanJay,
    PinyonJay,
    StellarsJay,
    WesternScrubJay,
    
    //Fringillidae: Finches
    AmericanGoldfinch,
    BlackRosyFinch,
    Brambling,
    CassinsFinch,
    CommonsRedpoll,
    GrayCrownedRosyFinch,
    HoaryRedpoll,
    HouseFinch,
    PineGrosbeak,
    PineSiskin,
    PurpleFinch,
    WhitewingedCrossbill,
    
    //Mimidae: Mockinbirds and Thrashers
    BahamaMockingbird,
    BindiresThrasher,
    BlueMockinbird,
    BrownThrasher,
    CaliforniaThrasher,
    CrissalThrasher,
    CurveBilledThrasher,
    GrayCatbird,
    LeContesThrasher,
    LongBilledThrasher,
    NorthernMockingbird,
    SageThrasher,
    
    //Emberizidae: Sparrows
    AmericanTreeSparrow,
    BachmansSparrow,
    BlackChinnedSparrow,
    BlackThroatedSparrow,
    BrewersSparrow,
    ChippingSparrow,
    FieldSparrow,
    FoxSparrow,
    HenslowsSparrow,
    LincolnsSparrow,
    RufousCrownedSparrow,
    SongSparrow,
    
    //Hirundinidae: Swallows and Martins
    BankSwallow,
    BarnSwallow,
    BrownChestedMartin,
    CaveSwallow,
    CliffSwallow,
    CommonHouseMartin,
    GrayBreastedMartin,
    MangroveSwallow,
    NorthernRoughWingedSwallow,
    PurpleMartin,
    TreeSwallow,
    VioletGreenSwallow,
    
    //Thraupidae: Tanagers
    FlameColoredTanager,
    HepaticTanager,
    ScarletTanager,
    SummerTanager,
    WesternSpindalls,
    WesternTanager,
    
    //Turdidae: Thrushes
    AmericanRobin,
    Bluethroat,
    ClayColoredThrush,
    DuskyThrush,
    Fieldfare,
    GrayCheekedThrush,
    HermitThrush,
    Redwing,
    SongThrush,
    SwainsonsThrush,
    Veery,
    WoodThrush,
    
    //Paridae: Tits and Chickadees
    BlackCappedChickadee,
    BlackCrestedChickadee,
    BorealChickadee,
    BridledTitmouse,
    CarolinaChickadee,
    ChestnutBackedChickadee,
    GrayHeadedChickadee,
    JuniperTitmouse,
    MexicanChickadee,
    MountainChickadee,
    OakTitmouse,
    TuftedTitmouse,
    
    //Tyrannidae: Tyrant Flycatchers
    AcadianFlycatcher,
    AlderFlycatcher,
    AshThroatedFlycatcher,
    BlackPhoebe,
    DuskyFlycatcher,
    EasternPhoebe,
    EasternWoodPeewee,
    GreatChestedFlycatcher,
    HammondsFlycatcher,
    LeastFlycatcher,
    WesternWoodPeewee,
    YellowBelliedFlycatcher,
    
    //Vireonidae: Vireos
    BellsVireo,
    BlackCappedVireo,
    BlueHeadedVireo,
    CassinsVireo,
    GrayVireo,
    HuttonsVireo,
    PhiladelphiaVireo,
    PlumbeousVireo,
    RedEyedVireo,
    WarblingVireo,
    WhiteEyedVireo,
    YellowThroatedVireo,
    
    //Motacillidae: Wagtails and Pips
    AmericanPipit,
    CitrineWagtail,
    EasternYellowWagtail,
    GrayWagtail,
    OliveBackedPipit,
    PechoraPipit,
    RedThroatedPipit,
    SpraguesPipit,
    TreePipit,
    WhiteWagtail,
    
    //Parulidae: Wood Warblers
    AmericanRedstart,
    BayBreastedWarbler,
    BlackAndWhiteWarbler,
    BlackThroatedGreenWarbler,
    BlackburnianWarbler,
    BlueWingedWarbler,
    ChestnutSidedWarbler,
    GoldenWingedWarbler,
    HoodedWarbler,
    NashvilleWarbler,
    WilsonsWarbler,
    YellowThroatedWarbler,
    
    //Troglodytidae: Wrens
    BewicksWren,
    CactusWren,
    CanyonWren,
    CarolinaWren,
    HouseWren,
    MarshWren,
    RockWren,
    SedgeWren,
    WinterWren
} Species;*/

//This figures out which of the four sets this bird is
/*typedef enum {
    setA,
    setB,
    setC,
    setD
} Set;*/

@interface Deck : NSObject {
    
    NSDictionary *mainDictionary;
    NSMutableArray *speciesArray;
    int cardsLeft;
    NSMutableArray *cards;
    int arrayCounter;
    
}

@property (nonatomic, assign) NSDictionary *mainDictionary;
@property (nonatomic, assign) NSMutableArray *speciesArray;
@property (nonatomic, assign) int cardsLeft;
@property (nonatomic, retain) NSMutableArray *cards;
@property (nonatomic, assign) int arrayCounter;

-(id)initWithFamilyOne:(Family)familyOne FamilyTwo:(Family)familyTwo andFamilyThree:(Family)familyThree;
-(void)getRandomSpeciesFromDictionary:(NSDictionary *)familyDictionary;
-(NSMutableArray *)populateCardArray;
-(void)shuffleDeck;

NSInteger randomSort(id obj1, id obj2, void *context);
@end
