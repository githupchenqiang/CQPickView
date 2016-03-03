
//
//  RootTableViewController.m
//  
//
//  Created by  on 15/8/10.
//
//

#import "RootTableViewController.h"
#import "Contact.h"
#import "BoyTableViewCell.h"
#import "GirlTableViewCell.h"
@interface RootTableViewController ()

//最外层的字典
@property (nonatomic ,retain)NSMutableDictionary *dict;

//分组名数组
@property (nonatomic ,retain)NSMutableArray *groupArray;




@end

@implementation RootTableViewController

//系统重用标识符
//static NSString *const reusedID = @"systom";



//Boytableviewcell的重用标识符
static NSString *const Boyreusert = @"boy";

//Boytableviewcell的重用标识符
static NSString *const Girlreusert = @"girl";


- (void)dealloc
{
    [_dict release];
    [_groupArray release];
    [super dealloc];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"BJS150622" ofType:@"plist"];
        
        NSDictionary *tempdic = [NSDictionary dictionaryWithContentsOfFile:path];
        
        //获取分组名
        self.groupArray = [[tempdic allKeys]mutableCopy];
        
        //对分组名排序
        [self.groupArray sortUsingSelector:@selector(compare:)];
        
        //字典预开辟空间
        self.dict = [[NSMutableDictionary alloc]initWithCapacity:26];
        
        //遍历字典
        for (NSString *key in tempdic) {
            //遍历字典获取到得是key值,通过对应的key值找到对应的value;
            NSArray *array = tempdic[key];
            
            //定义一个数组用来接受model对象
            NSMutableArray *tempArray = [NSMutableArray array];
            
            //遍历数组找到最里层的字典,进行KVC赋值并添加到数组temparray;
            for (NSDictionary *dict in array) {
                Contact *contact = [[Contact new]autorelease];
                [contact setValuesForKeysWithDictionary:dict];
                [tempArray addObject:contact];
                
                
            }
            //字典添加元素
            [self.dict setObject:tempArray forKey:key];
        }
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册一个自定义cell;
    
    [self.tableView registerClass:[BoyTableViewCell class] forCellReuseIdentifier:Boyreusert];
    [self.tableView registerClass:[GirlTableViewCell class] forCellReuseIdentifier:Girlreusert];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    //返回数组元素的个数
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //返回字典中元素的个数
    
    return  [self.dict[self.groupArray[section]]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //找到所在分组中的key值
    NSString *key = self.groupArray[indexPath.section];
    
    //找到所在的分组
    NSArray *array = self.dict[key];
    
    //找到唯一的model对象
    Contact *contact = array[indexPath.row];
    
    if ([contact.gender isEqualToString:@"女"]) {
        
        GirlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Girlreusert forIndexPath:indexPath];
        cell.hobbylabel.frame = CGRectMake(10, 220, 335, [self textHeight:contact.hobby]);
        cell.contact = contact;
        cell.namelabel.text = contact.name;
        cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",contact.name]];
        
        return cell;
    }
    
   
    BoyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Boyreusert forIndexPath:indexPath];
    cell.hobbylabel.frame = CGRectMake(10, 220, 335, [self textHeight:contact.hobby]);
    cell.contact = contact;
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",contact.name]];
  
   return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //找到所在分组的key值
    NSString *key = self.groupArray[indexPath.section];
    
    //找到所在数组
    NSArray *array = self.dict[key];
    
    //找到唯一的model对象
    Contact *contact = array[indexPath.row];
    return 240 + [self textHeight:contact.hobby];
}

-(CGFloat)textHeight:(NSString *)str{
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(335, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.height;
    
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
